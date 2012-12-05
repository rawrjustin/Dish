class CateredMeal < Meal
  # attr_accessible :title, :body
  attr_accessible :phone, :address, :catered_meal_tray_ids, :catered_meal_trays_attributes
  validates :phone, :address, :presence => true
  acts_as_commentable
  has_many :catered_meal_trays
  accepts_nested_attributes_for :catered_meal_trays, :allow_destroy => true
end
