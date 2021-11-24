class AddImageToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :image, :string
  end
end
