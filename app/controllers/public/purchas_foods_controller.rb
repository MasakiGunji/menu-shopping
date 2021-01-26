class Public::PurchasFoodsController < ApplicationController
  before_action :authenticate_end_u!
  def index
    @purchas_foods = PurchasFood.where(end_user_id: current_end_user.id)
  end
end
