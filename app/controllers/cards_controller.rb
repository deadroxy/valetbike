class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
    @user = current_user
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      # Redirect the user to the appropriate location
      redirect_to card_path(@card)
    else
      # If the card object cannot be saved, re-render the form with validation errors
      render :new
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
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end
end
