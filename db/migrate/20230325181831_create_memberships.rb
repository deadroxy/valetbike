class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.integer :identifier
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :payment_frequency
      t.integer :cost
      t.string :time_unit
      t.integer :rentals_available

      t.timestamps
    end
  end
end
