class Post < ActiveRecord::Base
  attr_accessible :title, :author, :content, :thumb
  validates :title, :author, :content, :presence => true

  def thumbnail
    if self.thumb != ""
      return self.thumb
    else
      return "http://placehold.it/320x214&text=No%20Image"
    end
  end
end
