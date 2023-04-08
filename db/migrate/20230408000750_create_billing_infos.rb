class CreateBillingInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_infos do |t|
      t.string :card_first_name
      t.string :card_last_name
      t.string :street_address
      t.string :city
      t.string :state_province
      t.string :zip_code
      t.string :country
      t.references :logins, null: false, foreign_key: true

      t.timestamps
    end
  end
end
