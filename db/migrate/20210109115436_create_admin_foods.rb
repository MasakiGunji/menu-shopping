class CreateAdminFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_foods do |t|
      t.integer :food_genre_id
      t.string :name
      t.string :u
      
      t.timestamps
    end
  end
end
