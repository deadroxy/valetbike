class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
    event = Stripe::Webhook.construct_event(
      payload, sig_header, ENV['WEBHOOK_KEY']
    )
    rescue JSON::ParserError => e
      status 400
    return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      puts "huzzah"
      session = event.data.object
      membership_assignment = MembershipAssignment.find_by(id: session.metadata.membership_assignment_id)]
      membership_assignment.is_paid = true
      membership_assignment.save!
    end

    render json: { message: 'success' }
  end
end
