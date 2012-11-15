class MealsController < ApplicationController
  def index
    @q = Meal.search(params[:q])
    @meals = @q.result.page(params[:page])
    if params[:q] and params[:q][:cost_eq]
      @active_2 = params[:q][:cost_eq] == "Under $2"
      @active_5 = params[:q][:cost_eq] == "Under $5"
    end
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
