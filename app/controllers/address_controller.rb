class AddressController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update
        if Current.user.update(address_params)
            redirect_to user_home_path, notice: "Address changed"
        else
            puts 123
            render :edit
        end
    end

    private

    def address_params
        params.require(:user).permit(:address)
    end

end