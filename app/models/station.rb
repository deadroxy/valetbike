class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           :address
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  has_and_belongs_to_many :rentings 

  geocoded_by :address 
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    where("name LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%") 
  end
  
  
end
