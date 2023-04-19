class UserMailer < ApplicationMailer
    default from: 'valetbike223@gmail.com'
    
    def verification_email
        @user = params[:user]
        @vcode = params[:vcode]
        mail(to: @user.email, subject: 'Verification code')

        puts "Success!"
    end
end