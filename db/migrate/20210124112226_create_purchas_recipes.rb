class CreatePurchasRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :purchas_recipes do |t|
      t.integer :end_user_id
      t.integer :recipe_id
      t.integer :amount
      
      t.timestamps
    end
  end
end
