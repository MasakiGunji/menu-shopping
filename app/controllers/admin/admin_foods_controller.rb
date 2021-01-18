class Admin::AdminFoodsController < ApplicationController

  def index
    @admin_food = AdminFood.new
    @food_genres = FoodGenre.includes(:admin_foods).all
  end

  def create
    @admin_food = AdminFood.new(admin_food_params)
    @admin_food.save
    redirect_to admin_admin_foods_path
  end

  def edit
    @admin_food = AdminFood.find(params[:id])
    @food_genres = FoodGenre.includes(:admin_foods).all
  end

  def update
    @admin_food = AdminFood.find(params[:id])
    @admin_food.update(admin_food_params)
    redirect_to admin_admin_foods_path
  end

  def destroy
    @admin_food = AdminFood.find(params[:id])
    @admin_food.destroy
    redirect_to admin_admin_foods_path
  end

  private
  def admin_food_params
    params.require(:admin_food).permit(:food_genre_id, :name, :unit, :status)
  end
end
