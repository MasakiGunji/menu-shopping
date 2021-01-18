class Public::RecipesController < ApplicationController
  def index
    @recipe_genres = RecipeGenre.includes(:recipes).where(recipes: {end_user_id: current_end_user.id})
  end

  def new
    @recipe = Recipe.new
    @recipe_genres = RecipeGenre.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.end_user_id = current_end_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_genres = RecipeGenre.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :body, :image, :recipe_genre_id, :end_user_id)
  end
end
