class CreatePurchasFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :purchas_foods do |t|
      t.integer :end_user_id
      t.integer :food_id
      t.integer :numerator
      t.integer :denominator

      t.timestamps
    end
  end
end
