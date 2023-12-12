class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create 
        payload = request.body.read
        signature_header = request.env['HTTP_STRIPE_SIGNATURE']
        endpoint_secret = "whsec_b0c4e430a22d74d0e0656fb84172e5336a0ed759aa99f111b329c341871ecffa"
        event = nil 

        begin 
            event = Stripe::Webhook.construct_event(
                payload, signature_header, endpoint_secret
            )

        rescue JSON::ParserError => e 
            render json: { message: e }, status: 400
        rescue Stripe::SignatureVerificationError => e 
            render json: { message: e }, status: 400
            return 
        end 

        case event.type 
        when 'checkout.session.completed'
            return if !User.exists?(event.data.object.client_reference_id)

            fulfill_order(event.data.object)

        when 'checkout.session.async_payment_succeeded'
        
        when 'invoice.payment_succeeded'
            # return if subscription id is not present 
            return unless event.data.object.subscription.present?
            # continue to provision subscription when payment is made 
            stripe_subscription = Stripe::Subscription.retrieve(event.data.object.subscription)
            subscription = Membership.find_by(subscription_id: stripe_subscription.id)

            subscription.update(
                current_period_start: Time.at(stripe_subscription.current_period_start).to_datetime,
                current_period_end: Time.at(stripe_subscription.current_period_end).to_datetime, 
                membership_id: stripe_subscription.plan.id,
        interval: stripe_subscription.plan.interval,
        status: stripe_subscription.status
            )

        when 'invoice.payment_failed'
            # payment failed or not valid 
            # subscription becomes past_due 
            # notify customer and send them to customer portal 
            user = User.find_by(stripe_customer_id: event.data.object.customer)
            if user.exists?
                SubscriptionMailer.with(user: :user).payment_failed.deliver_now
            end 
        when 'customer.subscription.updated'
            stripe_subscription = event.data.object 

            if stripe_subscription.cancel_at_period_end == true
                subscription = Membership.find_by(subscription_id: stripe_subscription.id)
                if subscription.present?
                    subscription.update(
                        current_period_start: Time.at(stripe_subscription.current_period_start).to_datetime,
                        current_period_end: Time.at(stripe_subscription.current_period_end).to_datetime, 
                        membership_id: stripe_subscription.plan.id,
            interval: stripe_subscription.plan.interval,
            status: stripe_subscription.status)
                end 
            end 
        else 
            puts "Unhandled event type: #{event.type}"
        end 

        render json: { message: 'success' }
    end

    private 
    def fulfill_order(checkout_session)
        #find the user and assign customer id from stripe 
        user = User.find(checkout_session.client_reference_id)
        user.update(stripe_customer_id: checkout_session.customer)

        #retrieve new subscription via Stripe 
        stripe_subscription = Stripe::Subscription.retrieve(checkout_session.subscription)

        # create a new subscription with stripe details and user details 
        Membership.create!(
            customer_id: stripe_subscription.customer,
            current_period_start: Time.at(stripe_subscription.current_period_start).to_datetime,
            current_period_end: Time.at(stripe_subscription.current_period_end).to_datetime,
            membership_id: stripe_subscription.plan.id,
            interval: stripe_subscription.plan.interval,
            status: stripe_subscription.status,
            subscription_id: stripe_subscription.id,
            user: user
        )

    end 
end
