class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           :street,
                           :city,
                           :state,
                           :country,
                           :zipcode,
                           :latitude,
                           :longitude
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id

  def address 
    [street, city, state, country].compact.join(", ") 
  end 

  def address_changed? 
    street_changed?||city_changed?||zip_changed?||state_changed? 
  end 

  geocoded_by :address 
  #after_validation :geocode, if: address_changed?
  
  def self.search(search)
    stations = [{identifier: "wuieiu", name: "Atkins Farms Country Market", address: "Amherst, Massachusetts", zipcode: "01063"}, {identifier: "edyhjds", name: "Atkins Farms Country Market", address: "South Amherst, Massachusetts", zipcode: "01963"}, {identifier: "ewieio", name: "Atkins Farms Country Market", address: "Northampton, Massachusetts", zipcode: "04063"}]

    if search
      # result = Station.find_by(:name search, :zipcode search)
      result = stations.find {|i| i[:zipcode] == search}
      if result
        self.where(station_id: result)
      end
    else
      @stations = Station.all.order(identifier: :asc)

    end
  end
  
end
