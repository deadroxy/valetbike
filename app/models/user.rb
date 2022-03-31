class User < ApplicationRecord
    has_secure_password

    validates_presence_of   :identifier,
                            :firstName,
                            :lastName,
                            :email,
                            :phoneNumber,
                            :milesRidden,   #depends on rides
                            :timesRidden    #depends on rides
    validates_uniqueness_of :identifier

    belongs_to :rides, class_name: :Ride, foreign_key: :user_id
end
