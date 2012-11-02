class Menu < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :phone, :address, :servings, :description
end
