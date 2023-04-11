class PagesController < ApplicationController
    def rental 
        @bike_id = Bike.find(params[:id]).identifier
        render('rental')
    end

end
