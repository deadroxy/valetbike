class CheckoutsController < ApplicationController
    def create
        cancel_url = pages_home_url
        success_url = pages_home_url
        metadata = {}
        amount = 0
        name = "Test"
        if params[:type] == "0"
            cancel_url = membership_new_url
            success_url = pages_home_url
            #success_url = membership_assignment_create_url(:membership_assignment=>{:user_id=>current_user.id, :membership_id=>params[:id]})
            puts success_url
            #success_url = {:controller => "membership_assignment", :action => "create", :membershipassignment=>{:user_id=>current_user.id, :membership_id=>params[:id]}}
            metadata = {membership_assignment_id: params[:id]}
            amount = MembershipAssignment.find(params[:id]).membership.price_in_cents
            name = MembershipAssignment.find(params[:id]).membership.name
        elsif params[:type] == "1"
            cancel_url = stations_index_url
            metadata = {rental_id: params[:id]}
            amount = 2000
            name = "30 minute bike rental"
        elsif params[:type] == "2"
            cancel_url = account_url
            metadata = {overdue_id: params[:id]}
            amount = Overdue.find(params[:id]).cost
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
        
        # render 'checkouts/pay'
        redirect_to '/checkout-session', {:session_id => @session.id}
        # respond_to do |format|
        #   format.js
        # end
      end      
end
