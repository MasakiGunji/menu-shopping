class Public::HomesController < ApplicationController
  def top
    @recipe_genres = RecipeGenre.all
  end

  def about
  end
end
