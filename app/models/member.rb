class Member < ApplicationRecord
  has_many :rides
  has_many :reports
  has_many :reviews
  has_many :favorite_routes
  has_many :favorite_stations

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
