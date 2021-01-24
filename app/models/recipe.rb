class Recipe < ApplicationRecord
  belongs_to :end_user
  belongs_to :recipe_genre
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  attachment :image
end
