class ServiceController < ApplicationController

    # def new
    #   @service = Service.new(service_params)
    # end



    def create
        @service= Service.new(service_params)
      
        if @service.save
            redirect_to service_path @service, notice: "Successfully submitted service request"

        else
            render 'service' 
            flash[:notice] = "Your service request could not be created."

        end
    end
      
    private
      
      def service_params
        params.require(:service).permit(:name, :email, :bike_number, :bike_station, :additional_information)
      end

      def show
        @service = Service.find(params[:name])
      end
end 