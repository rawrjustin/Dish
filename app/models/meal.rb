class Meal < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :servings, :thumb
  validates :name, :description, :servings, :thumb, :presence => true
  validates_numericality_of :servings
end
