class Admin::FoodsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @food = Food.new
    @food_genres = FoodGenre.includes(:foods).all
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to admin_foods_path
  end

  def edit
    @food = Food.find(params[:id])
    @food_genres = FoodGenre.includes(:foods).all
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to admin_foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to admin_foods_path
  end

  private
  def food_params
    params.require(:food).permit(:food_genre_id, :name, :unit, :status)
  end
end
