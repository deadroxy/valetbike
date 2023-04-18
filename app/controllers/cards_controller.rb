class CardsController < ApplicationController
  def index
    @cards = Card.all
    
  end

  def show
    @card = Card.find(params[:id])
    # puts @card.inspect
  end


  def new
    @card = Card.new(card_balance: 100)
  end

  def create
    @card = Card.new(card_balance: 100, **card_params)

    if @card.save
      redirect_to cards_path, notice: "Card was successfully added."
    else
      puts @card.errors.full_messages
      render ('new')
    end
  end 


  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
      if @card.update(card_params)
        redirect_to card_path(@card)
      else
        render('edit')
      end
  end


  def pay
    @card = Card.find(params[:id])
    amount = 6.12

    if @card.card_balance >= amount
      @card.card_balance -= amount

      if @card.save
        redirect_to renting_create_path(:station_id => params[:station_id]), notice: "Payment Successful!"
      else
        flash.alert = "A problem occured and payment did not go through. Please try again"
      end

    else
      flash.alert = "Card does not have enough funds"
      render('index')

    end

  end

  def delete
    @card = Card.find(params[:id])
  end 

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
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
