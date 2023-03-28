class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :identifier
      t.string :card_holder_name,
      t.integer :card_number,
      t.integer :CVC,
      t.string :billing_address
      t.datetime :expiration_date,
      t.timestamps
    end
  end
end
