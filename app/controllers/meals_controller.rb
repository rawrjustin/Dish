class MealsController < ApplicationController
  def index
    @q = Meal.search(params[:q])
    results = @q.result(:distinct => true)
    if results.count > 0
      @meals = results
    else
      @meals = Meal.all
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