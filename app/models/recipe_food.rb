class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def division
    numerator/denominator
  end

  def remainder
    numerator%denominator
  end
end
