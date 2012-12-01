class Location < ActiveRecord::Base
  attr_accessible :address, :city, :name
  has_many :ingredients
  validates :name, :city, :presence => true

  def display_name
    self.name + " (" + self.city + ")"
  end
end
