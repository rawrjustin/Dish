class Meal < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :servings, :thumb, :cost
  validates :name, :description, :servings, :thumb, :cost, :presence => true
  validates_numericality_of :servings
  validates :cost,
    :inclusion => { :in => ['Under $2', 'Under $5'], :message => "%{value} is not a valid option for cost"}
end
