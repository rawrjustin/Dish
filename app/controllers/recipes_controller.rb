class RecipesController < ApplicationController

  def index
    @active_all = !params[:type] || params[:type] == ""
    @active_main = params[:type] == "Main"
    @active_sides = params[:type] == "Sides"
    @active_soups = params[:type] == "Soups"
    @active_salads = params[:type] == "Salads"
    @active_desserts = params[:type] == "Desserts"
		@dropdown_label = "Showing all recipes"
		@dropdown_description = "All recipes. Delicious!"
    if not params[:q]
      params[:q] = {}
    end
    if params[:type]
       params[:q][:recipe_type_eq] = params[:type]
    end
    @q = Recipe.search(params[:q])
    @recipes = @q.result.page(params[:page]).per(9)

		@search_field = :name_or_description_cont
  end

  def show
    @active_default = !params[:servings] || params[:servings] == ""
		@active_5 = params[:servings] == "5"
		@active_10 = params[:servings] == "10"
		@active_20 = params[:servings] == "20"
		@active_50 = params[:servings] == "50"
    @unscaled_recipe = Recipe.find(params[:id])
		if !params[:servings] || params[:servings] == ""
      @recipe = @unscaled_recipe
    else
      @recipe = @unscaled_recipe.scale(params[:servings])
		end
	end
end
