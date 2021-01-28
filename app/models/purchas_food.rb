class PurchasFood < ApplicationRecord
  belongs_to :end_user
  belongs_to :food

  def division
    numerator/denominator
  end

  def remainder
    numerator%denominator
  end
end
