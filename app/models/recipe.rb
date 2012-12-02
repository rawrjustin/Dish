class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :image, :recipe_type
  validates :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :recipe_type, :presence => true
  validates_numericality_of :time_in_minutes, :servings, :total_cost
  validates :recipe_type,
    :inclusion => { :in => ['Main', 'Sides', 'Soups', 'Salads', 'Desserts'], :message => "%{value} is not a valid type of recipe"}
  #mount_uploader :image, ImageUploader
  
  def cpp
    # cost per person
    if servings > 0
      cost_per_person = self.total_cost.to_f / self.servings.to_f
    end
    return cost_per_person.to_f
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
