class CookedMeal < Meal
  attr_accessible :directions, :time_in_minutes, :ingredient_ids, :cooked_meal_ingredients_attributes
  validates :directions, :time_in_minutes, :presence => true
  validates_numericality_of :time_in_minutes, :greater_than_or_equal_to => 0
  has_many :cooked_meal_ingredients
  accepts_nested_attributes_for :cooked_meal_ingredients, :allow_destroy => true
  has_many :ingredients, :through => :cooked_meal_ingredients
  before_validation :update_cost

  def scale(amount_people)
    #returns a CookedMeal object replica that has it's cookedmealingredients scaled
    ratio = amount_people.to_f / 200.to_f
    new_cooked_meal = CookedMeal.new(:name => self.name,
                                     :description => self.description,
                                     :thumb => self.thumb,
                                     :directions => self.directions,
                                     :time_in_minutes => self.time_in_minutes)
    self.cooked_meal_ingredients.each do |cooked_meal_ingredient|
      temp_cmi = CookedMealIngredient.new(:amount => (ratio * cooked_meal_ingredient.amount.to_f).round(2))
      temp_cmi.ingredient = cooked_meal_ingredient.ingredient
      new_cooked_meal.cooked_meal_ingredients << temp_cmi
    end
    new_cooked_meal.servings = amount_people
    return new_cooked_meal
  end

  def total_cost
    tc = 0.0
    self.cooked_meal_ingredients.each do |cooked_meal_ingredient|
      tc += cooked_meal_ingredient.ingredient.price * cooked_meal_ingredient.amount
    end
    return tc.round(2)
  end

  attr_accessor :servings
  def cost_per_person
    if servings
      return (self.total_cost.to_f / servings.to_f).round(2)
    else
      return (self.total_cost.to_f / 200.to_f).round(2)
    end
  end

  def time
    hours = self.time_in_minutes.to_i / 60
    mins = self.time_in_minutes.to_i - hours * 60
    total_time = ''
    if hours > 0
      if hours == 1
        total_time += "1 hour "
      else
        total_time += "#{hours} hours "
      end
    end
    if mins > 0
      if mins == 1
        total_time += "1 min"
      else
        total_time += "#{mins} mins"
      end
    end
    return total_time.strip
  end

  def update_cost
    costpp = self.cost_per_person.to_f
    if costpp < 2.0
      self.cost = "Under $2"
    elsif costpp < 5.0
      self.cost = "Under $5"
    else
      self.cost = "Over $5"
    end
  end

end
