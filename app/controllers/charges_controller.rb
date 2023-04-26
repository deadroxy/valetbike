class ChargesController < ApplicationController
  before_action :authenticate_user!
                :amount_to_be_charged
                :set_description
                :find_membership

  def thanks
  end

  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
      
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: @desciption,
      currency: 'usd'
    )
  
    redirect_to thanks_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @memberships
    end

  private

    def amount_to_be_charged
      @amount = 500
    end

    def description
      @desciprtion = "Some amazing membership"
    end

    def find_membership
      @membership= Membership.find(params[:membership_id])
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = 'Membership not found!'
        redirect_to root_path
    end
end

