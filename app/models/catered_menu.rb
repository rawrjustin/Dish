class CateredMenu < Menu
  # attr_accessible :title, :body
  attr_accessible :phone, :address
  validates :phone, :address, :presence => true
end
