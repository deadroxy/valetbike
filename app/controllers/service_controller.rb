class ServiceController < ApplicationController

    def new
      @service = Service.new(params)
      #@service= Service.new(params.require(:service).permit(:name, :email, :bike_number, :bike_station, :additional_information))

      render :new
    end



    def create
       @service = Service.new(service_params)
      # @service[:name] = Renting.find(params[:renting_id])
        #@service= Service.new(params.require(:service).permit(:name, :email, :bike_number, :bike_station, :additional_information))
       # @service.save
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

    # def create
    #     @service= Service.new(service_params)

    #     begin
    #         @service.save
    #         flash[:success] = "New to-do item service added!"
            
    #     rescue 
    #         redirect_to service_path #ActiveRecord: :RecordInvalid => e
    #         #render 'new', :status => :unprocessable_entity
    #     end
    # end
      
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