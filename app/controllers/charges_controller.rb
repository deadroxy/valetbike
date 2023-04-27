class ChargesController < ApplicationController
  before_action :authenticate_user!
                :amount_to_be_charged
                :set_description

  def thanks
  end

  def new
  end

  def index
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
      
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 1800,
      description: @desciption,
      currency: 'usd'
    )
  
    redirect_to thanks_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @memberships

  private

    def description
      @desciprtion = "Some amazing membership"
    end


  end
end

