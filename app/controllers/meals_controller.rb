class MealsController < ApplicationController
  def index
    @active_2 = params[:cost] == "Under $2"
    @active_5 = !params[:cost] || params[:cost] == "Under $5"
		@dropdown_label = "Showing all meals"
    if not params[:q]
      params[:q] = {}
    end
    if params[:cost] == "Under $2"
		  @dropdown_label = "Showing meals under $2"
      params[:q][:cost_eq] = "Under $2"
    end
    @q = Meal.search(params[:q])
    @meals = @q.result.page(params[:page])
		
		@search_field = :name_or_description_cont
  end

  def show
	  if !params[:servings]
		  params[:servings] = "200"
		end
    @active_150 = params[:servings] == "150"
    @active_200 = params[:servings] == "200"
		@active_250 = params[:servings] == "250"
	
    @unscaled_meal = Meal.find(params[:id])
		@meal = @unscaled_meal.scale(params[:servings])
    if @meal.type == "CookedMeal"
      render "show_cooked_meal"
    elsif @meal.type == "CateredMeal"
      render "show_catered_meal"
    end
  end
	
end
