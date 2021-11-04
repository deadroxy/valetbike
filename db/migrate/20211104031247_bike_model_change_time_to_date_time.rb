class BikeModelChangeTimeToDateTime < ActiveRecord::Migration[6.1]
  def change
    change_column :bikes, :checkinTime, :datetime
    change_column :bikes, :checkoutTime, :datetime
  end
end
