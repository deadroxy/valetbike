class AddPlanCategoryToMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :category, :string
  end
end
