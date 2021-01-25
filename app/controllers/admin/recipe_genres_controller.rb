class Admin::RecipeGenresController < ApplicationController
  def index
    @recipe_genres = RecipeGenre.all
    @recipe_genre = RecipeGenre.new
  end

  def create
    @recipe_genre = RecipeGenre.new(recipe_genre_params)
    @recipe_genre.save
    redirect_to admin_recipe_genres_path
  end

  def update
    @recipe_genre = RecipeGenre.find(params[:id])
    @recipe_genre.update(recipe_genre_params)
    redirect_to admin_recipe_genres_path
  end

  def destroy
    @recipe_genre = RecipeGenre.find(params[:id])
    @recipe_genre.destroy
    redirect_to admin_recipe_genres_path
  end

  private

  def recipe_genre_params
    params.require(:recipe_genre).permit(:name)
  end
end
