class CookedMeal < Meal
  attr_accessible :directions, :time_in_minutes, :ingredient_ids, :cooked_meal_ingredients_attributes
  validates :directions, :time_in_minutes, :presence => true
  validates_numericality_of :time_in_minutes, :greater_than_or_equal_to => 0
  has_many :cooked_meal_ingredients
  accepts_nested_attributes_for :cooked_meal_ingredients, :allow_destroy => true
  has_many :ingredients, :through => :cooked_meal_ingredients

  def total_cost
    tc = 0.0
    self.cooked_meal_ingredients.each do |cooked_meal_ingredient|
      tc += cooked_meal_ingredient.ingredient.price * cooked_meal_ingredient.amount
    end
    return tc
  end

  def cost_per_person
    # cost per person
    if servings > 0
      cpp = self.total_cost.to_f / self.servings.to_f
    end
    return cpp.to_f
  end

  def cost
    if cost_per_person < 2.0
      return "Under $2"
    elsif cost_per_person < 5.0
      return "Under $5"
    else
      return "Over $5"
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

end
