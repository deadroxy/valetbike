class StationModel < ApplicationRecord
    validates_presence_of :address,
                          :station_name,
                          :station_id,
                          :has_kiosk,
                          :num_docks
    has_many :bikes
    def get_address
        @address
    end
    
    def has_bikes
        if @bikes >= 1
            true
        end
    end

    def get_num_docks
        @num_docks
    end

    def get_num_bikes
        #return number of bikes docked at Station
        @bikes.count
    end

    def get_available_docks
        #return number of empty docks at station
        @num_docks - @bikes.count
    end

end
