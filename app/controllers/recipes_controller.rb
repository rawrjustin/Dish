class RecipesController < ApplicationController
  def index
    @q = Recipe.search(params[:q])
    results = @q.result(:distinct => true) 
    if results.count > 0 
      @recipes = results
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
