class RecipesController < ApplicationController

  def index
    @q = Recipe.search(params[:q])
    @recipes = @q.result.page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
