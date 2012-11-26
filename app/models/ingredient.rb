class Ingredient < ActiveRecord::Base
  attr_accessible :location, :name, :notes, :photo, :price
end
