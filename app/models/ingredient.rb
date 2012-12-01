class Ingredient < ActiveRecord::Base
  attr_accessible :location, :name, :notes, :photo, :price, :location_id
  belongs_to :location
  validates :name, :price, :location, :presence => true
  validates_numericality_of :price, :on => :create, :greater_than_or_equal_to => 0
end
