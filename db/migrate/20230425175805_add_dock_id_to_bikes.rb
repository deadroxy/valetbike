class AddDockIdToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column(:bikes, :dock_id, :integer, index: true)
  end
end
