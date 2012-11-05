require 'spec_helper'

describe MealsController do
  describe "GET 'index'" do
    it 'should fetch meals from the database' do
      Meal.should_receive(:all)
      get 'index'
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
    it "should show a cooked meal" do
      Meal.should_receive(:find).and_return(@r1)
      get 'show', :id => 1
      response.should render_template('show_cooked_meal')
    end
    it "should show a catered meal" do
      Meal.should_receive(:find).and_return(@r2)
      get 'show', :id => 1
      response.should render_template('show_catered_meal')
    end
  end

end
