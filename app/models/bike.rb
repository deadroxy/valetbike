class Bike < ApplicationRecord
  validates_presence_of    :identifier#,
                           #:dock_id

  
  validates_uniqueness_of  :identifier#,
                           #:dock_id
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true

  has_many :rentals, class_name: :Rental, foreign_key: :bike_id

  # belongs_to: user, class_name: :User, foreign_key: :user_id, optional: true

  before_update :set_default_dock, if: Proc.new {|t| t.current_station && (t.dock_id.blank? || t.dock_id < 1) }

  attr_accessor :current_station_id


  def get_station()
    current_station_id
  end

  def get_ride()
    rental_id
  end

  def get_dock()
    dock_id
  end

  def get_status()
    if (get_ride != nil)
      get_ride()
    else
      get_dock()
    end
  end

  def station_id=(new_station_id)
    @station_id = new
  end

  private
    def set_default_dock
        max = Bike.where(current_station: self.current_station).maximum(:dock_id) || 0
        self.dock_id = max + 1
    end

end
