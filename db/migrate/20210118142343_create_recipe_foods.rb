class CreateRecipeFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_foods do |t|
      t.integer :recipe_id
      t.integer :food_id
      t.integer :numerator, default: 1
      t.integer :denominator, default: 1
      t.string :other_unit, null: true

      t.timestamps
    end
  end
end
