class Public::RecipesController < ApplicationController
  def index_all
    if params[:id]
      @recipes = Recipe.where(recipe_genre_id: params[:id]).order(id: "DESC")
      @recipe_genre = RecipeGenre.find(params[:id])
    else
      @recipes = Recipe.all.order(id: "DESC")
    end
    @recipe_genres = RecipeGenre.all
  end

  def index
    if end_user_signed_in?
      if params[:id]
        @recipes = Recipe.where(recipe_genre_id: params[:id], end_user_id: current_end_user.id).order(id: "DESC")
        @recipe_genre = RecipeGenre.find(params[:id])
      else
        @recipes = Recipe.where(end_user_id: current_end_user.id).order(id: "DESC")
      end
      @recipe_genres = RecipeGenre.all
    else
      redirect_to new_end_user_session_path
    end
  end

  def new
    if end_user_signed_in?
      @recipe = Recipe.new
      @recipe_genres = RecipeGenre.all
    else
      redirect_to new_end_user_session_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.end_user_id = current_end_user.id
    @recipe.save
    redirect_to new_recipe_recipe_food_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @purchas_recipe = PurchasRecipe.new
    @food_genres = FoodGenre.includes(:recipe_foods).where(recipe_foods: { recipe_id: params[:id]})
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
