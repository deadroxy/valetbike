class Bike < ApplicationRecord
  validates_presence_of    :identifier#,
                           #:dock_id

  
  validates_uniqueness_of  :identifier#,
                           #:dock_id
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true

  has_many :rentals, class_name: :Rental, foreign_key: :bike_id

  # belongs_to: user, class_name: :User, foreign_key: :user_id, optional: true
  # belongs_to :rental, class_name: :Rental, foreign_key: rental_id, optional: true


  def get_station()
    current_station_id
  end

  def get_ride()
    rental_id
  end

  def get_dock()
    @dock_id
  end

  def get_status()
    if (get_ride != nil)
      get_ride()
    else
      get_dock()
    end
  end

end
