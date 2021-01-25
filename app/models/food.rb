class Food < ApplicationRecord
  belongs_to :food_genre
  has_many :recipe_foods
  has_many :recipes, through: :recipes_foods
  has_many :purchas_foods
  enum status: { integer: 0, fraction: 1, string: 2 }
end
