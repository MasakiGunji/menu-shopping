class FoodGenre < ApplicationRecord
  has_many :admin_foods, dependent: :destroy
end
