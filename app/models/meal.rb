class Meal < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :thumb
  validates :name, :description, :thumb, :presence => true
end
