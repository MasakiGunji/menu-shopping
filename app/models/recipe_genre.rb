class RecipeGenre < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
