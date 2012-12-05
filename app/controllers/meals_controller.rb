class MealsController < ApplicationController
  def index
    @active_5 = !params[:cost] || params[:cost] == "Under $5"
    @active_2 = params[:cost] == "Under $2"
		@dropdown_label = "Showing all meals"
    if not params[:q]
      params[:q] = {}
    end
    if params[:cost] == "Under $2"
      params[:q][:cost_eq] = params[:cost]
    end
    @q = Meal.search(params[:q])
    @meals = @q.result.page(params[:page]).per(9)

		@search_field = :name_or_description_cont
  end

  def show
    @unscaled_meal = Meal.find(params[:id])
    if @unscaled_meal.type == "CookedMeal"
      if !params[:servings]
        params[:servings] = "200"
      end
      @active_150 = params[:servings] == "150"
      @active_200 = params[:servings] == "200"
      @active_250 = params[:servings] == "250"
      @meal = @unscaled_meal.scale(params[:servings])
      render "show_cooked_meal"
    elsif @unscaled_meal.type == "CateredMeal"
      @meal = @unscaled_meal
      @trays = {}
      @meal.catered_meal_trays.each do |tray|
        if !@trays.has_key?(tray.size)
          @trays[tray.size] = []
        end
        @trays[tray.size].push(tray)
      end
      render "show_catered_meal"
    end
  end
end
