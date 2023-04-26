class RentalsController < ApplicationController
    def new
        @rental = Rental.new
        #@current_time = Time.now 
       
    end

    def show 
        @rental = Rental.find(params[:id])
    end 


    # @form = UserInvitationForm.new(user_invitation_form_params)
    # if @form.submit
    #   redirect_to root_path, notice: 'Thank you for your enquiry'
    # else
    #   render :new
    # end
    

    def create
        puts "rental is #{@rental}"
        @rental = Rental.new(params.require(:rental).permit(:user_id, :bike_id, :start_station_id, :end_station_id, :end_time, :price, :start_time, :end_time ))
        if @rental.save 
            puts "saved"
            @current_bike = Bike.where(id: @rental.bike_id )
            @current_bike.update(current_station_identifier: 0, status: 1) 

            #puts params[:bike_id]
            #bikes = Bike.where(current_station_identifier: @station.identifier )
           #
            # puts "bike is "
            # puts  @current_bike 
            # @current_bike.update(current_station_identifier: 00)
            # puts "changed station"

            #remove bike from station 
            #change bike status to one 
            redirect_to rental_path(@rental) # this should actually go to the active ride page, just wanted somwhere random to send it for now 
        else
            render('new') 
            puts "save failed"
        end
    
    def update
        @rental = Rental.find(params[:id])
        if @rental.update(params.require(:station).permit(:user_id, :bike_id, :start_station_id, :end_station_id, :end_time, :price, :start_time, :end_time ))
      
        @current_user = User.where(id: @rental.user_id)
        @new_credit = current_user.credit-10
        @current_user.update(credit: new_credit)
        @rental.save
        flash[:success] = "Your scooter is successfully returned!"
        redirect_to '/index'

        else
        puts 'save failed'
        render ('edit')
        end
    end
    
    def edit
        @rental = Rental.find(params[:id])
    end


       #@rental = Rental.create(params.require(:user_id).permit(:user_id, :bike_id, :start_time, :start_station_id,))
        #redirect_to '/welcome'
    #redirect_to '/welcome'
        #instantate using
        #current user
        #bike we just redierected from 
         

    end

end 
