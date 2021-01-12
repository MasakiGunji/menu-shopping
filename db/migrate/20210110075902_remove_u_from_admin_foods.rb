class RemoveUFromAdminFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_foods, :u, :string
  end
end
