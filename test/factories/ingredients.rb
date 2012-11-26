# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "MyString"
    location "MyString"
    price 1.5
    photo "MyString"
    notes "MyText"
  end
end
