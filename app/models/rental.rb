class Rental < ApplicationRecord
    
    belongs_to :bike, class_name: :Bike, foreign_key: :bike_id, optional: false
    belongs_to :renter, class_name: :User, foreign_key: :renter_id, optional: false
    
end
