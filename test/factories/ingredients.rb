# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "Cucumber"
    association :location
    price 1.5
    photo "MyString"
    notes "yummy when fresh"
  end
end
