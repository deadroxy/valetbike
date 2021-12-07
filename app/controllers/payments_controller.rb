class PaymentsController < ApplicationController
  def index
    puts "Load payment page"
  end

  def update
    puts "enter update function"
    puts params[:membership]
    puts current_user.email
    current_user.update_attribute(:membership, params[:membership])
    #puts current_user.membership
    # respond_to do |format|
    #   format.js {}
  end
end
