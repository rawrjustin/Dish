class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :image, :recipe_type
  validates :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :recipe_type, :presence => true
  validates_numericality_of :time_in_minutes, :servings, :total_cost
  #mount_uploader :image, ImageUploader
  
  before_save :default_values
  
  def default_values
    if self.image.to_s.length == 0
      self.image = 'defaultfood.png'
      self.save!
    end
  end
  
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
end
