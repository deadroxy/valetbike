class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :rented_bikes, class_name: :Bike, foreign_key: :user_id
end
