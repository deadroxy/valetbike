class User < ApplicationRecord
    validates_presence_of    :username,
                             :first_name,
                             :last_name,
                             :password,
                             :email
                             :trip


    validates_uniqueness_of  :username

    has_many :trips
    has_many :comments
    has_many :payments

end