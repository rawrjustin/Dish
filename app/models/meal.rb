class Meal < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :thumb, :cost
  validates :name, :description, :thumb, :cost, :presence => true
  acts_as_commentable
end
