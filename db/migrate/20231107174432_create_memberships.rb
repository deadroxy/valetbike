class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.string :name
      t.text :rate
      t.integer :rentlength

      t.timestamps
    end
  end
end
#membership id is built in 
#need to figure out best var type for rate
