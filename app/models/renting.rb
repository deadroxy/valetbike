class Renting < ApplicationRecord
    scope :completed, -> { where(status: true) }
    scope :sorted, -> {order(:identifier)}

    # belongs_to :user
    # belongs_to :bike, foreign_key: :bike_id
    has_and_belongs_to_many :stations
    

    def rentCode
        Random.rand(1111...9999)
    end

    def returnCode
        Random.rand(1111...9999)
    end

    def duration
        endTime - startTime
    end

    def date date
        date.to_fs(:db)
    end 

end
