class RenameUColumnToAdminFoods < ActiveRecord::Migration[5.2]
  def chang
    rename_column :admin_foods, :u, :unit
  end
end
