class PurchasRecipe < ApplicationRecord
  validates :amount, :numericality => { :greater_than => 0 }
  belongs_to :end_user
  belongs_to :recipe
end
