class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
        t.string    :username
        t.string    :password
        t.string    :first_name
        t.string    :last_name
        t.string    :email
        t.string    :phone_number
        t.integer   :miles_ridden
        t.integer   :ride_count

        t.timestamps
    end
  end
end