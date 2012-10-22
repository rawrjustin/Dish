class RecipesController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.create!(params[:recipe])
    flash[:notice] = "#{@recipe.name} was successfully created."
    redirect_to recipe_path(@recipe.id)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @q = Recipe.search(params[:q])
    results = @q.result(:distinct => true) 
    if results.count > 0 
      @recipes = results
    else
      @recipes = Recipe.all
    end
    
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
