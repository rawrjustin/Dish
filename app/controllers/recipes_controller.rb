class RecipesController < ApplicationController
  @@descriptions = Hash.new
	@@descriptions[""] = "Showing all dishes"
	@@descriptions["Main"] = "Showing main dishes"
	@@descriptions["Sides"] = "Showing side dishes"
	@@descriptions["Soups"] = "Showing soups"
	@@descriptions["Desserts"] = "Showing desserts"

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
   		 @dropdown_label = @@descriptions[params[:type]]
       @dropdown_description = "Select Category"
    end
    @q = Recipe.search(params[:q])
    @recipes = @q.result.page(params[:page])
		
		@search_field = :name_or_description_cont
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
