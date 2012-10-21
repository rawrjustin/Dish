class RecipesController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.valid?
      @recipe.save!
      flash[:notice] = "#{@recipe.name} was successfully created."
      redirect_to recipes_path
    elsif
      flash[:notice] = @recipe.errors.to_a.join(", ")
      redirect_to new_recipe_path
    end
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
