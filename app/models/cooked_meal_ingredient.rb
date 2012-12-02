class CookedMealIngredient < ActiveRecord::Base
  attr_accessible :amount, :cooked_meal_id, :ingredient_id
  validates :amount, :ingredient_id, :presence => true
  validates_numericality_of :amount
  belongs_to :ingredient
  belongs_to :cooked_meal
end
