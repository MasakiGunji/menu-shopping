class Public::RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.includes(:recipe_foods, :foods).find(params[:recipe_id])
    @food_genres = FoodGenre.includes(:foods).all
    @recipe_food_genres = FoodGenre.includes(:recipe_foods).where(recipe_foods: { recipe_id: params[:recipe_id]})
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    @recipe_food.save
    redirect_to new_recipe_recipe_food_path
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(recipe_food_params)
    redirect_to new_recipe_recipe_food_path
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to new_recipe_recipe_food_path
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :numerator, :denominator, :other_unit)
  end
end
