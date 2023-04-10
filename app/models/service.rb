class Service < ApplicationRecord

    # def name
    #   #[name]
    # end

    # def email
    #   #  [email]
    # end
    validates_presence_of  :name
                           :email
                           :bike_number
                           :bike_station
                           :additional_information
  #validates_uniqueness_of  :identifier

 #belongs_to :renting
end
