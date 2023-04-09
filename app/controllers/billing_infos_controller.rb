class BillingInfosController < ApplicationController
  def index
    @billing_infos = BillingInfo.all
  end

  def show
    @billing_info = BillingInfo.find(params[:id])
  end
  
  def new
    @billing_info = BillingInfo.new
  end

  def create
    @billing_info = BillingInfo.new(billing_info_params)
    if @billing_info.save
      # Redirect the user to the appropriate location
      redirect_to billing_info_path(@billing_info)
    else
      # If the billing info object cannot be saved, re-render the form with validation errors
      render :new
    end
  end
  
  def edit
    @billing_info = BillingInfo.find(params[:id])
  end

  def update
    @billing_info = BillingInfo.find(params[:id])
    if @billing_info.update(billing_info_params)
      redirect_to billing_info_path(@billing_info)
    else
      render :edit
    end
  end

  def destroy
    @billing_info = BillingInfo.find(params[:id])
    @billing_info.destroy
    redirect_to billing_infos_path
  end


private

  def billing_info_params
    params.require(:billing_info).permit(:card_first_name, :card_last_name, :street_address, :city, :state, :zip_code, :country)
  end
end