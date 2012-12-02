class CookedMeal < Meal
  attr_accessible :directions, :time_in_minutes, :ingredient_ids, :cooked_meal_ingredients_attributes
  validates :directions, :time_in_minutes, :presence => true
  validates_numericality_of :time_in_minutes
  has_many :cooked_meal_ingredients
  accepts_nested_attributes_for :cooked_meal_ingredients, :allow_destroy => true
  has_many :ingredients, :through => :cooked_meal_ingredients
end
