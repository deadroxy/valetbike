class ChargesController < ApplicationController
  before_action :amount_to_be_charged

  def new
  end

  def create

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def amount_to_be_charged
      @amount = 500
    end
end