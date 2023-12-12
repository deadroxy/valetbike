class AddTotalDocksColumn < ActiveRecord::Migration[7.0]
  def change
    add_column(:stations, :total_docks, :integer)
  end
end
