class CheckoutsController < ApplicationController
    def create
        cancel_url = pages_home_url
        success_url = pages_home_url
        metadata = {}
        amount = 700
        name = "Test"
        if params[:type] == "0"
            @membershipassignment = MembershipAssignment.new(user_id: current_user.id, membership_id: params[:id])
            unless @membershipassignment.save 
                @membershipassignment.get_membership
                render('membership_assignment/new')
            end
            @membershipassignment.update(start: Time.now)
            puts(@membershipassignment.membership.cost == 0)
            if @membershipassignment.membership.cost == 0
                redirect_to pages_home_path
                return
            end
            cancel_url = membership_new_url
            success_url = pages_home_url
            #success_url = membership_assignment_create_url(:membership_assignment=>{:user_id=>current_user.id, :membership_id=>params[:id]})
            puts success_url
            #success_url = {:controller => "membership_assignment", :action => "create", :membershipassignment=>{:user_id=>current_user.id, :membership_id=>params[:id]}}
            metadata = {membership_assignment_id: @membershipassignment.id}
            amount = @membershipassignment.membership.price_in_cents
            puts "amount: " + amount.to_s 
            name = @membershipassignment.membership.name
        elsif params[:type] == "1"
            cancel_url = stations_index_url
            metadata = {rental_id: params[:id]}
            amount = 2000
            name = "30 minute bike rental"
        elsif params[:type] == "2"
            cancel_url = account_url
            success_url = account_url
            metadata = {overdue_id: params[:id]}
            amount = Overdue.find(params[:id]).cost
            Overdue.destroy(params[:id])
            name = "Overtime charge"
        end
        @session = Stripe::Checkout::Session.create({
          success_url: success_url,
          cancel_url: cancel_url,
          payment_method_types: ['card'],
          line_items: [{
            price_data: {
                currency: 'usd',
                unit_amount: amount,
                product_data: {
                  name: name,
                },
              },
              quantity: 1
          }],
          mode: 'payment',
          metadata: metadata
          #customer_email: current_user.email        
        })
        #puts @session
        # render 'checkouts/pay'
        redirect_to checkouts_pay_path(:id => @session.id)
        #render  @session.url, allow_other_host: true
        # respond_to do |format|
        #   format.js
        # end
        # redirect_to Stripe::Checkout::Session.retrieve(@session.id).url, allow_other_host: true
      end      
      def pay
        @session = Stripe::Checkout::Session.retrieve(params[:id])
      end
end
