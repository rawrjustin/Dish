class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost
  validates :name, :description, :ingredients, :directions, :time_in_minutes, :servings, :total_cost, :presence => true
  validates_numericality_of :time_in_minutes, :servings, :total_cost

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
    return total_time
  end
end
