class AddCheckoutTimeToBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :time_checkedout, :datetime
  end
end
