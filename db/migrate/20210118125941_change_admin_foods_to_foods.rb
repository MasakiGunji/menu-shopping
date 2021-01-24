class ChangeAdminFoodsToFoods < ActiveRecord::Migration[5.2]
  def change
    rename_table :admin_foods, :foods
  end
end
