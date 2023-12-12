class PagesController < ApplicationController
    def show
        render template: "pages/#{params[:page]}"
    end

    def map
       # Your 'map' action code goes here
    end
  
    skip_before_action :verify_authenticity_token, only: [:create_checkout_session]

    def create_checkout_session
        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [
            {
              price: 'price_1OMFTOJg0jV0uG9HzvRLtahp',
              quantity: 1,
            },
          ],
          mode: 'payment',
          success_url: root_url,
          cancel_url: root_url,
        )
    
        render json: { id: session.id }
    end
    
  end 
