class TimeEndToDatetime < ActiveRecord::Migration[7.0]
  def change
    change_column(:rides, :timeEnd, :datetime)
  end
end
