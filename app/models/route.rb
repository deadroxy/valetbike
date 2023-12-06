class Route < ApplicationRecord
  has_many :reviews
  has_many :favorite_routes
  belongs_to :map
end