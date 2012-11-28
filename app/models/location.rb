class Location < ActiveRecord::Base
  attr_accessible :address, :city, :name
  has_many :ingredients
end
