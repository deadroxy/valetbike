class AddAttributeNameToService < ActiveRecord::Migration[7.0]
  def change
    # add_column :services, :bike_number, :string
    # add_column :services, :bike_station, :string
    # add_column :services, :additional_information :string
    add_column :bike_number, :bike_station, :additional_information
  end
end
