class AdminFood < ApplicationRecord
  belongs_to :food_genre
  enum status:{ integer: 0, fraction: 1, string: 2}
end
