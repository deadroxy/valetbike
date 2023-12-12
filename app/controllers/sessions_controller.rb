class SessionsController < ApplicationController
    def new
      @member = Member.new
    end

    def create
      @member = Member.find_by(username: params[:username])
        if @member && @member.authenticate(params[:password])
          log_in(@member)
          redirect_to root_path, notice: 'Login was successful!'
        else
           flash.now[:alert] = 'Invalid membername/password'
           render 'new'
        end
    end

    def destroy
      log_out()
      redirect_to root_path, notice: 'Logged out'
    end
end
