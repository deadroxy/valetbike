class SetBikeAvailDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:bikes, :avail, true)

  end
end
