require 'spec_helper'

describe RecipesController do
  describe '.list_recipes' do
    before :each do
      @r1 = mock('Recipe')
      @r1.stub(:name).and_return('Dabogee')
      @r2 = mock('Recipe')
      @r2.stub(:name).and_return('Lime Chicken')
    end
    it 'Fetch recipes from the database' do
      Recipe.should_receive(:all)
      get 'index'
    end
  end

  describe 'new' do
    it 'should render the view with the new recipe form' do
      get 'new'
      response.should render_template('new')
    end
  end

  describe 'create' do
    before :each do
      @recipe = FactoryGirl.create(:recipe)
    end
    it 'should call the model to create a new recipe in the database' do
      @recipe.stub(:valid?).and_return(true)
      Recipe.should_receive(:new).and_return(@recipe)
      get 'create'
    end
    it 'should redirect to recipe details page upon submission' do
      @recipe.stub(:valid?).and_return(true)
      Recipe.stub(:new).and_return(@recipe)
      get 'create'
      response.should redirect_to(recipe_path(@recipe.id))
    end
    it 'should fail for invalid inputs' do
      @recipe.stub(:valid?).and_return(false)
      Recipe.stub(:new).and_return(@recipe)
      get 'create'
      response.should redirect_to(new_recipe_path)
    end
  end

end
