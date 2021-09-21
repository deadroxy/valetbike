class AddMaintenanceToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :needs_maintenance, :integer
  end
end
