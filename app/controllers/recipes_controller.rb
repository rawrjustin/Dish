class RecipesController < ApplicationController

  def index
    @active_main = params[:type] == "Main"
    @active_sides = params[:type] == "Sides"
    @active_soups = params[:type] == "Soups"
    @active_salads = params[:type] == "Salads"
    @active_desserts = params[:type] == "Desserts"
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
