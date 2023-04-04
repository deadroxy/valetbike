class Rental < ApplicationRecord
    
    belongs_to :bike, class_name: :Bike, foreign_key: :bike_id, optional: false

end
