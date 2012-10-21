class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost
  validates :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :presence => true
  validates_numericality_of :time_in_minutes, :servings, :total_cost
end
