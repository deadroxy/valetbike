class CreateFavoriteRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_routes do |t|

      t.timestamps
    end
  end
end
