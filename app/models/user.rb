class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of :email 

    validates_uniqueness_of :phone_num
    validates :username, presence: true
end
