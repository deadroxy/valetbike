class ServiceController < ApplicationController

    def new
      @service = Service.new(params)
      render :new
    end



    def create
       @service = Service.new(service_params)
        if @service.save
            puts "###############"
            redirect_to service_path
            flash[:success] = " Service request successfully submitted!"
        else
            puts "********"
            render 'index' 
            flash[:danger] = "Your service request could not be created."

        end
    end
      
    private
      
      def service_params
        puts "!!!!!!"
       # params.permit( :name, :email, :bike_number, :bike_station, :additional_information)
        params.permit(:name, :email, :bike_number, :bike_station, :additional_information)
      end

      def show
        @service = Service.find(params[:name])
      end

end 