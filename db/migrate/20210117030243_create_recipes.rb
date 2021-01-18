class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :end_user_id
      t.integer :recipe_genre_id
      t.string :image_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
