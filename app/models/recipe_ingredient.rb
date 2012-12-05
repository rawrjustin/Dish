class RecipeIngredient < ActiveRecord::Base
  attr_accessible :amount, :recipe_id, :ingredient_id
  validates :amount, :ingredient_id, :presence => true
  validates_numericality_of :amount
  belongs_to :ingredient
  belongs_to :recipe

  def price
    return (self.amount * self.ingredient.price).round(2)
  end
end
