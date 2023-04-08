class ChangeCardNumberDataTypeInCards < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :card_number, :integer
  end
end
