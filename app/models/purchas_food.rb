class PurchasFood < ApplicationRecord
  belongs_to :end_user
  belongs_to :food
end