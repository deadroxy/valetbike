class CreateMembershipAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :membership, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :rentals_remaining

      t.timestamps
    end
  end
end
