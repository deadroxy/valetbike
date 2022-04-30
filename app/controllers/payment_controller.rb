class PaymentController < ApplicationController
  def plan1
    Current.user.update_attribute(:payment,"per ride")
    redirect_to pay_path, notice: 'You have selected per ride'
  end
  def plan2
    Current.user.update_attribute(:payment,"pro")
    # puts "pro.. /#{Current.user.payment}"
    # puts "email.. /#{Current.user.email}"
    redirect_to pay_path, notice: 'You have selected pro'

  end
  def plan3
    Current.user.update_attribute(:payment,"premium")
    redirect_to pay_path, notice: 'You have selected premium'
  end

  def plans

  end
  def pay

  end
  def redirect
    redirect_to root_path, notice: 'Thanks for your payment'
  end

  def cancel
    Current.user.update_attribute(:payment,"")
    redirect_to profile_path, notice: 'You have canceled your Membership'
  end
end
