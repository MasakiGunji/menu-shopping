class Admin::AdminFoodsController < ApplicationController
  
  def index
    @admin_foods = AdminFood.all
    @admin_food = AdminFood.new
    @food_genres = FoodGenre.all
    @food_genre = FoodGenre.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
