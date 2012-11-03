class Menu < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :servings
  validates :name, :description, :servings, :presence => true
  validates_numericality_of :servings
end
