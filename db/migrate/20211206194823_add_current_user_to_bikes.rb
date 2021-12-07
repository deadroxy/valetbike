class AddCurrentUserToBikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :bikes, :user, null: true, foreign_key: true
  end
end
