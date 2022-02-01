class AddBikesColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :station_id, :integer
  end
end
