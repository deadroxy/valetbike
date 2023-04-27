class AddBasicInfoToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :digits, :string
    add_column :cards, :month, :integer
    add_column :cards, :year, :integer
  end
end
