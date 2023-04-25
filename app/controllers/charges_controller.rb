class ChargesController < ApplicationController
  before_action :authenticate_user!
                :find_membership

  def new
  end

  def create
    stripe_card_id =
      if params[:card].present?
        CreditCardService.new(current_user.id, card_params).create_card
      else
        charge_params[:card_id]
      end
  
    Stripe::Charge.create(
      customer: current_user.customer_id,
      source:   stripe_card_id,
      amount:   @membership.price,
      currency: 'usd'
    )
  
    if params[:card].present? && stripe_card_id
      current_user.cards.create_with(card_params).find_or_create_by(stripe_id: stripe_card_id)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @membership
    end

  private

  def card_params
    params.require(:card).permit(:number, :month, :year, :cvc)
  end
  
  def charge_params
    params.permit(:card_id)
  end
  
  def find_membership
    @membership= Membership.find(params[:membership_id])
  
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = 'Membership not found!'
    redirect_to root_path
  end
end

