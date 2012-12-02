class RecipesController < ApplicationController

  def index
    @main = params[:type] == "Main"
    @sides = params[:type] == "Sides"
    @soups = params[:type] == "Soups"
    @salads = params[:type] == "Salads"
    @desserts = params[:type] == "Desserts"
    if not params[:q]
      params[:q] = {}
    end
    if params[:type]
       params[:q][:recipe_type_eq] = params[:type]
    end
    @q = Recipe.search(params[:q])
    @recipes = @q.result.page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
