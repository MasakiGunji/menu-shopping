class Recipe < ApplicationRecord
  belongs_to :end_user
  belongs_to :recipe_genre
  attachment :image
end
