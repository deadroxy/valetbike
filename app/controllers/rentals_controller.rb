class RentalsController < ApplicationController
    before_action :authenticate_user!

    def index
        @stations = Station.all.order(identifier: :asc)
    end

    def show
        @station = Station.find(params[:id])
        @bikes = Bike.where(current_station_id: @station.identifier)
    end

    def new 
        if Rental.find_by(user_id: current_user.id).present?

            if Rental.find_by(user_id: current_user.id).end_station_id.present?
                @rental = Rental.new(start_time: Time.now, 
                user_id: current_user.id,
                card_id: current_user.current_card.id,
                bike_id: Bike.find_by(id: params[:rental]).identifier,
                start_station_id: Bike.find_by(id: params[:rental]).current_station.identifier)
                Station.find_by(identifier: Bike.find_by(id: params[:rental]).current_station.identifier).docked_bikes.delete(Bike.find_by(id: params[:rental]))
            else
                @rental = Rental.find_by(user_id: current_user.id)
                redirect_to rentals_path
                flash[:notice] = "You can only rent one bike at a time. Please end the ride to rent a new one."
            end
        else
            @rental = Rental.new(start_time: Time.now, 
                                user_id: current_user.id,
                                card_id: current_user.current_card.id,
                                bike_id: Bike.find_by(id: params[:rental]).identifier,
                                start_station_id: Bike.find_by(id: params[:rental]).current_station.identifier)
            Station.find_by(identifier: Bike.find_by(id: params[:rental]).current_station.identifier).docked_bikes.delete(Bike.find_by(id: params[:rental]))
           
        end

    end

    def create
        @rental = Rental.new(params.require(:rental).permit(:start_time,:user_id,:card_id,:bike_id,:start_station_id))
        if @rental.save
            flash[:notice] = "Rental was successful"
            redirect_to edit_rental_path(@rental)
            
        else
            if @rental.errors.any?
                flash[:alert] = @rental.errors.full_messages
            end
            render('new', :status => :unprocessable_entity)
            
        end

    end

    def edit 
        puts("edit page")
        @rental = Rental.find_by_id(params[:id])   
    end

    def update
        Rental.find_by_id(params[:id]).update(end_time: Time.now, status: "closed",end_station_id: params[:rental][:end_station_id]) 
        Station.find_by_id(params[:rental][:end_station_id]).docked_bikes << Bike.find_by(identifier: Rental.find_by_id(params[:id]).bike_id)
        redirect_to rentals_path
    end
end



