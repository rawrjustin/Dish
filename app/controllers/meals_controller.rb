class MealsController < ApplicationController
  def index
    @q = Meal.search(params[:q])
    @meals = @q.result.page(params[:page])
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
