class Renting < ApplicationRecord
    scope :completed, -> {where(status: true)}
    scope :sorted, -> {order(:identifier)}

    belongs_to :user
    belongs_to :bike, foreign_key: :bike_id
    has_and_belongs_to_many :stations, foreign_key: :current_station_id
    

    def rentCode
        @rentCode = Random.rand(1111...9999)
    end

    def returnCode
        @returnCode = Random.rand(1111...9999)
    end


end
