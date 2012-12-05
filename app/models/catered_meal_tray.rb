class CateredMealTray < ActiveRecord::Base
  attr_accessible :name, :size, :servings, :cost, :catered_meal_id
  validates :name, :size, :servings, :cost, :presence => true
  validates_numericality_of :servings, :cost
  belongs_to :catered_meal
end
