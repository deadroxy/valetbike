class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :paypal_plan_name

      t.timestamps
    end
    add_money :memberships, :price, currency: { present: true}
  end
end
