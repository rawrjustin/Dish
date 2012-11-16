class Post < ActiveRecord::Base
  attr_accessible :title, :author, :content
  validates :title, :author, :content, :presence => true
end
