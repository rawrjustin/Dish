require 'spec_helper'

describe RecipesController do

  describe '.list_recipes' do
    it 'Fetch recipes from the database' do
      Recipe.should_receive(:all)
      get 'index'
    end
  end

  describe ".show" do
    before :each do
      @r1 = mock('Recipe')
      @r1.stub(:name).and_return('Lime Chicken')
    end
    it "should show a lime chicken recipe" do
      Recipe.should_receive(:find).and_return(@r1)
      get 'show', :id => 1
      response.should render_template('show')
    end
  end

end
