class MealsController < ApplicationController
  def index
    @active_2 = params[:cost] == "Under $2"
    @active_5 = !params[:cost] || params[:cost] == ""
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
    @meal = Meal.find(params[:id])
    if @meal.type == "CookedMeal"
      render "show_cooked_meal"
    elsif @meal.type == "CateredMeal"
      render "show_catered_meal"
    end
  end
end
