class RecipesController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.create!(params[:recipe])
    flash[:notice] = "#{@recipe.name} was successfully created."
    redirect_to recipes_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
