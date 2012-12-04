require 'spec_helper'

describe Location do
  describe "display name" do
    before :each do
      @location = FactoryGirl.create(:location)
      @location.stub(:name).and_return("Koreana")
      @location.stub(:city).and_return("Oakland")
    end
    it "should display the correct name" do
      @location.display_name.should == "Koreana (Oakland)"
    end
  end
end
