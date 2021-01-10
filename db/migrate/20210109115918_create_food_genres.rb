class CreateFoodGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :food_genres do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
