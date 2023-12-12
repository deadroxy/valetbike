class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.boolean :isResolved
      t.text :description

      t.timestamps
    end
  end
end
