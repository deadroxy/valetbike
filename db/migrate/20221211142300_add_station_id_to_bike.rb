class AddStationIdToBike < ActiveRecord::Migration[7.0]
    def change
        add_column(:bikes, :station_id, :string)
    end
end 