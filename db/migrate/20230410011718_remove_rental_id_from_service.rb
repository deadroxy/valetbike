class RemoveRentalIdFromService < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :rental_id
  end
end
