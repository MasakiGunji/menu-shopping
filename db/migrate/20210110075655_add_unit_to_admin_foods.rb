class AddUnitToAdminFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_foods, :unit, :string
  end
end
