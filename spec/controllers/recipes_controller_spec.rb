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
      Recipe.should_receive(:find_all)
      post :recipes
    end
  end

  describe 'new' do
    it 'should render the view with the new recipe form' do
      get 'new'
      response.should render_template('new')
    end
  end

  describe 'create' do
    it 'should call the model to create a new recipe in the database' do
      recipe = mock('recipe')
      Recipe.should_receive(:create).and_return(recipe)
      get 'create', {:recipe => recipe}
    end
    it 'should redirect to recipe details page upon submission' do
      recipe = mock('recipe')
      Recipe.stub(:create).and_return(recipe)
      get 'create', {:recipe => recipe}
      response.should redirect_to('show')
    end
  end

end
