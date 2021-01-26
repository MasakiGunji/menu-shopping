class Admin::FoodGenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @food_genres = FoodGenre.all
    @food_genre = FoodGenre.new
  end

  def create
    @food_genre = FoodGenre.new(food_genre_params)
    @food_genre.save
    redirect_to admin_food_genres_path
  end

  def update
    @food_genre = FoodGenre.find(params[:id])
    @food_genre.update(food_genre_params)
    redirect_to admin_food_genres_path
  end

  def destroy
    @food_genre = FoodGenre.find(params[:id])
    @food_genre.destroy
    redirect_to admin_food_genres_path
  end

  private

  def food_genre_params
    params.require(:food_genre).permit(:name, :status)
  end
end
