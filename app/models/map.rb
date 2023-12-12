class Map < ApplicationRecord
  has_many :stations
  has_many :routes
end
