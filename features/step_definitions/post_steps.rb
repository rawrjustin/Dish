Given /^these cooking tips exist: "(.*?)"$/ do |posts|
  post_list = posts.split(/,\s*/)
  post_list.each do |title|
    m = Post.create
    m[:title] = title
    m[:author] = "Patrick"
    m[:content] = "..."
    m.save!
  end
end

When /^I fill in fields for cooking tip "(.*?)"$/ do |title|
  fill_in "Title", :with => title
  fill_in "Author", :with => "Justin"
  fill_in "Content", :with => "..."
end
