class CardsController < ApplicationController
  def index
  end

  def new
    @card = Card.new(card_balance: 100)
  end


  def create
    @card = Card.new(card_balance: 100, **card_params)

    if @card.save
      redirect_to payments_path, notice: "Card was successfully added."
    else
      puts @card.errors.full_messages
      render ('new')
    end
  end 


  def edit
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
