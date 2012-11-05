class CookedMeal < Meal
  # attr_accessible :title, :body
  attr_accessible :ingredients, :directions, :time_in_minutes
  validates :ingredients, :directions, :time_in_minutes, :presence => true
  validates_numericality_of :time_in_minutes
end
