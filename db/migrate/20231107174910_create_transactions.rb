class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.boolean :complete
      t.datetime :dateandtime

      t.timestamps
    end
  end
end
#user_id to be done later