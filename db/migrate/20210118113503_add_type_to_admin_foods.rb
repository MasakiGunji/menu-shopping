class AddTypeToAdminFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_foods, :type, :integer
  end
end
