class UserMailer < ApplicationMailer


  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  
  def password_reset(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "Account activation"
  end
end
