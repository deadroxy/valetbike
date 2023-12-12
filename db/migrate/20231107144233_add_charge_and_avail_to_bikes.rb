class AddChargeAndAvailToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column(:bikes, :charge, :integer)
    add_column(:bikes, :avail, :boolean)
  end
end
