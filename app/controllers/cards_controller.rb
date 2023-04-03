class CardsController < ApplicationController
  def index
  end

  def new
    @card = Card.new(card_balance: 100)
  end

  def edit
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to payments_path
    else 
      render ('new')
    end
  end

  def pay
  end

  private
  def card_params
    params.require(:card).permit(
      :cardholder_name,
      :card_number,
      :expiration_date,
      :cvv,
      :card_balance
    )
  end

end
