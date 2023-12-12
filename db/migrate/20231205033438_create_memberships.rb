class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.string :membership_id
      t.string :customer_id
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.datetime :current_period_start
      t.datetime :current_period_end

      t.timestamps
    end
  end
end
