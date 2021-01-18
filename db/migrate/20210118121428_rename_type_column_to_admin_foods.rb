class RenameTypeColumnToAdminFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :admin_foods, :type, :status
  end
end
