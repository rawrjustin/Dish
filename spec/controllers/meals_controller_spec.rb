require 'spec_helper'

describe MealsController do
  describe "GET 'index'" do
    it 'should fetch meals from the database' do
      get 'index'
      response.should render_template('index')
    end
  end

  describe "GET 'show'" do
    before :each do
      @r1 = mock('Meal')
      @r1.stub(:name).and_return('Asian Meatballs')
      @r1.stub(:type).and_return('CookedMeal')
      @r2 = mock('Meal')
      @r2.stub(:name).and_return('Peking Express')
      @r2.stub(:type).and_return('CateredMeal')
    end
  end

end
