require 'spec_helper'

describe Recipe do
  describe "cost per person" do
    before :each do
      @recipe = FactoryGirl.create(:recipe)
      @recipe.stub(:total_cost).and_return(100)
      @recipe.stub(:servings).and_return(50)
    end
    it "should return the cost per person" do
      @recipe.cpp.should == 2
    end
  end

  describe "time" do
    before :each do
      @recipe = FactoryGirl.create(:recipe)
    end

    it "should return 1 min" do
      @recipe.stub(:time_in_minutes).and_return(1)
      @recipe.time.should == "1 min"
    end
    it "should return 2 mins" do
      @recipe.stub(:time_in_minutes).and_return(2)
      @recipe.time.should == "2 mins"
    end
    it "should return 1 hour" do
      @recipe.stub(:time_in_minutes).and_return(60)
      @recipe.time.should == "1 hour"
    end
    it "should return 2 hours" do
      @recipe.stub(:time_in_minutes).and_return(120)
      @recipe.time.should == "2 hours"
    end
    it "should return 1 hour 12 mins" do
      @recipe.stub(:time_in_minutes).and_return(72)
      @recipe.time.should == "1 hour 12 mins"
    end
  end
end
