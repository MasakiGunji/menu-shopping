class FoodGenre < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :recipe_foods, through: :foods
  has_many :purchas_foods, through: :foods
end
