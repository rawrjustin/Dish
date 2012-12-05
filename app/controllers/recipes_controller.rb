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
    @recipes = @q.result.page(params[:page])
		
		@search_field = :name_or_description_cont
  end

  def show
    @unscaled_recipe = Recipe.find(params[:id])
    @recID = params[:id]
		if !params[:servings]
			params[:servings] = "10"
		end
		@active_5 = params[:servings] == "5"
		@active_10 = params[:servings] == "10"
		@active_20 = params[:servings] == "20"
		@active_50 = params[:servings] == "50"
		@recipe = @unscaled_recipe.scale(params[:servings])
		@comments = @unscaled_recipe.comments.recent.limit(50).all		
		
	end
	
	def add_new_comment
	  rec = Recipe.find(params[:recipe_id])

	  if params[:title].length == 0 or params[:comment].length ==0
	     flash[:alert] = "You need to enter both your name and a comment"
	     redirect_to :action => :show, :id => rec
	  else
	     rec.comments.create(:title => params[:title], :comment => params[:comment])
	     #rec.comments << Recipe.new(params[:comment])
	     redirect_to :action => :show, :id => rec
	  end
	  
    

  end
end
