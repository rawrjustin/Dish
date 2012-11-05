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
end
