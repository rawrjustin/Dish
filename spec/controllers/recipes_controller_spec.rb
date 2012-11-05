require 'spec_helper'

describe RecipesController do
  describe '.list_recipes' do
    it 'Fetch recipes from the database' do
      Recipe.should_receive(:all)
      get 'index'
    end
  end
end
