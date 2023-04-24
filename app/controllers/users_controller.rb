class UsersController < ApplicationController

    def new
        @user =User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            session[:username] = @user.username
            flash[:notice] = "User created."
            redirect_to root_path(@user)
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
        # if session[:username]
        #      @user = User.find(session[:username])
        # end
        # if logged_in?
        #     redirect_to user_home_path
        #  else
        #     redirect_to login_path
        # end
        #@username =cookies[:username]
        #@user = User.find params.require(:id)
        #@user = User.find(params[:id])
        #@username =cookies[:username]
    end
     
    private
 
    def user_params
        params.require(:user).permit(:username, :email, :password, :phone_num, :address, :birthday, :wallet_point, :default_payment)
    end

end
