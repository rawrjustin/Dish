class CateredMeal < Meal
  # attr_accessible :title, :body
  attr_accessible :phone, :address
  validates :phone, :address, :presence => true
  acts_as_commentable
end
