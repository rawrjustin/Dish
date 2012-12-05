class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :directions, :time_in_minutes, :servings, :image, :recipe_type, :ingredient_ids, :recipe_ingredients_attributes
  validates :name, :description, :directions, :time_in_minutes, :servings, :recipe_type, :presence => true
  validates_numericality_of :time_in_minutes, :servings, :total_cost, :greater_than_or_equal_to => 0
  validates :recipe_type,
    :inclusion => { :in => ['Main', 'Sides', 'Soups', 'Salads', 'Desserts'], :message => "%{value} is not a valid type of recipe"}
  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true
  has_many :ingredients, :through => :recipe_ingredients
  #mount_uploader :image, ImageUploader

  def scale(amount_people)
    #returns a Recipe object replica that has it's recipeingredients scaled
    if self.servings.to_f > 0.0
      ratio = amount_people.to_f / self.servings.to_f
    else
      ratio = 1.0
    end
    new_recipe = Recipe.new(:name => self.name,
                                     :description => self.description,
                                     :servings => amount_people,
                                     :image => self.image,
                                     :directions => self.directions,
                                     :time_in_minutes => self.time_in_minutes)
    self.recipe_ingredients.each do |recipe_ingredient|
      temp_cmi = RecipeIngredient.new(:amount => ratio * recipe_ingredient.amount.to_f)
      temp_cmi.ingredient = recipe_ingredient.ingredient
      new_recipe.recipe_ingredients << temp_cmi

    end
    return new_recipe
  end

  def total_cost
    tc = 0.0
    self.recipe_ingredients.each do |recipe_ingredient|
      tc += recipe_ingredient.ingredient.price * recipe_ingredient.amount
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

  def thumbnail
    if self.image != ""
      return self.image
    else
      return "http://placehold.it/240x175&text=No%20Image"
    end
  end

end
