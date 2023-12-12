class AddCategoryIdColumn < ActiveRecord::Migration[7.0]
  def change
    add_column(:routes, :category_id, :integer)
  end
end
