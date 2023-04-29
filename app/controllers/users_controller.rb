class UsersController < ApplicationController

    def new
        @user =User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            if @user.email == "bikesia@example.com"
                @user.admin = true
                @user.save
            end
            session[:user_id] = @user.id
            session[:username] = @user.username
            flash[:notice] = "User created."
            redirect_to root_path
        else
            render 'new'
        end
    
    end


    def edit
        if logged_in?
            redirect_to login_path
         else
            #let them change the mode
        end
    
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
     
    private
 
    def user_params
        params.require(:user).permit(:username, :email, :password, :phone_num, :address, :birthday, :wallet_point, :default_payment)
    end

end
