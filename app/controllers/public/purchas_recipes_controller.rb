class Public::PurchasRecipesController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @purchas_recipes = PurchasRecipe.includes(:recipe).where(end_user_id: current_end_user.id)
    @purchas_foods = PurchasFood.where(end_user_id: current_end_user.id)
    @food_genres = FoodGenre.includes(:purchas_foods).where(purchas_foods: { end_user_id: current_end_user.id}).order(id: "ASC")
  end

  def create
    if @purchas_recipe = PurchasRecipe.find_by(end_user_id: current_end_user.id, recipe_id: params[:purchas_recipe][:recipe_id])
      @purchas_recipe.amount += params[:purchas_recipe][:recipe_id].to_i
      @purchas_recipe.save
    else
      @purchas_recipe = PurchasRecipe.new(purchas_recipe_params)
      @purchas_recipe.end_user_id = current_end_user.id
      @purchas_recipe.save
    end
    @recipe = Recipe.includes(:recipe_foods,:foods).find(params[:purchas_recipe][:recipe_id])
    @recipe.recipe_foods.each do |recipe_food|
      @purchas_food = PurchasFood.find_by(end_user_id: current_end_user.id, food_id: recipe_food.food_id)
      if @purchas_food
        a = Rational(@purchas_food.numerator, @purchas_food.denominator)
        b = Rational(recipe_food.numerator * params[:purchas_recipe][:amount].to_i, recipe_food.denominator)
        c = a + b
        @purchas_food.numerator = c.numerator
        @purchas_food.denominator = c.denominator
        @purchas_food.save
      else
        @purchas_food = PurchasFood.new
        @purchas_food.end_user_id = current_end_user.id
        @purchas_food.food_id = recipe_food.food.id
        @purchas_food.numerator = recipe_food.numerator * params[:purchas_recipe][:amount].to_i
        @purchas_food.denominator = recipe_food.denominator
        @purchas_food.save
      end
    end
    redirect_to purchas_recipes_path
  end

  def update
    @purchas_recipe = PurchasRecipe.find(params[:id])
    if PurchasRecipe.new(purchas_recipe_params).amount > 0
      @purchas_recipe.recipe.recipe_foods.each do |recipe_food|
        @purchas_food = PurchasFood.find_by(end_user_id: current_end_user.id, food_id: recipe_food.food_id)
        a = Rational(@purchas_food.numerator, @purchas_food.denominator)
        b = Rational(recipe_food.numerator * (params[:purchas_recipe][:amount].to_i - @purchas_recipe.amount), recipe_food.denominator)
        c = a + b
        @purchas_food.numerator = c.numerator
        @purchas_food.denominator = c.denominator
        @purchas_food.save
        end
      @purchas_recipe.update(purchas_recipe_params)
      redirect_to purchas_recipes_path
    else
      redirect_to purchas_recipes_path
    end
  end

  def destroy
    @purchas_recipe = PurchasRecipe.find(params[:id])
    @purchas_recipe.recipe.recipe_foods.each do |recipe_food|
      @purchas_food = PurchasFood.find_by(end_user_id: current_end_user.id, food_id: recipe_food.food_id)
      a = Rational(@purchas_food.numerator, @purchas_food.denominator)
      b = Rational(recipe_food.numerator * @purchas_recipe.amount, recipe_food.denominator)
      c = a - b
      @purchas_food.numerator = c.numerator
      @purchas_food.denominator = c.denominator
      if @purchas_food.numerator == 0
        @purchas_food.destroy
      else
        @purchas_food.save
      end
    end
    @purchas_recipe.destroy
    redirect_to purchas_recipes_path
  end

  def destroy_all
    @purchas_recipes = PurchasRecipe.where(end_user_id: current_end_user.id)
    @purchas_recipes.destroy_all
    @purchas_foods = PurchasFood.where(end_user_id: current_end_user.id)
    @purchas_foods.destroy_all
    redirect_to purchas_recipes_path
  end

  private
  def purchas_recipe_params
    params.require(:purchas_recipe).permit(:amount, :recipe_id, :end_user_id)
  end
end
