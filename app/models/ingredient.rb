class Ingredient < ActiveRecord::Base
  attr_accessible :location, :name, :notes, :photo, :price, :location_id, :size
  belongs_to :location
  validates :name, :price, :location, :presence => true
  validates_numericality_of :price, :on => :create, :greater_than_or_equal_to => 0
  has_many :cooked_meal_ingredients
  has_many :cooked_meals, :through => :cooked_meal_ingredients
  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients

  def display_name
    if self.size == ""
      self.name
    else
      self.name + " (" + "$" + self.price.to_s + "/" + self.size + ")"
    end
  end
end
