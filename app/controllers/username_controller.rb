class UsernameController < ApplicationController
    before_action :require_user_log_in!

    def edit

    end

    def update
        if  Current.user
            Current.user.update(username: params[:username])
            Current.user.save
            puts Current.user.username
            flash[:success]= "Username Changed"
            redirect_to user_home_path
        # end
        # if Current.user.update(username_params)
        #      redirect_to user_home_path, notice: "Username"
        else
            render :edit
        end
    end

    # private

    # def username_params
    #     params.require(:user).permit(:username)
    # end

end