class CreatePasses < ActiveRecord::Migration[6.1]
  def change
    create_table :passes do |t|
      t.integer :total_days
      t.time :start_date
      t.num :price

      t.timestamps
    end
  end
end
