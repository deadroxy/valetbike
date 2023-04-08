class AddInfoNameToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :additional_information, :string
  end
end
