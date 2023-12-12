class AddReportConnection < ActiveRecord::Migration[7.0]
  def change
    add_column(:reports, :member_id, :integer, index: true)
    add_column(:reports, :bike_id, :integer, index: true)
  end
end
