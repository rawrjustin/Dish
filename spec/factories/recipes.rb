# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "MyString"
    description "MyText"
    servings 2
    ingredients "i can't believe it's not butter"
  end
end