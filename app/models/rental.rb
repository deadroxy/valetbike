class Rental < ApplicationRecord
    belongs_to :bike, class_name: :Bike, foreign_key: :bike_id
    belongs_to :user, class_name: :User, foreign_key: :user_id
    # belongs_to :user, class_name: :User, foreign_key: :user_id
    # belongs_to :bike, class_name: :Bike, foreign_key: :bike_id

end
