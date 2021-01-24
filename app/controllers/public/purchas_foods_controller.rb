class Public::PurchasFoodsController < ApplicationController
  def index
    @purchas_foods = PurchasFood.where(end_user_id: current_end_user.id)
  end
end
