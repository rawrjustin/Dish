require 'spec_helper'

describe Ingredient do
  describe "display ingredient" do
    before :each do
      @ingredient = FactoryGirl.create(:ingredient)
      @ingredient.stub(:name).and_return("cucumbers")
      @ingredient.stub(:size).and_return("5 lbs")
    end
    it "should return correct display name" do
      @ingredient.display_name.should == "cucumbers (5 lbs)"
    end
  end
end
