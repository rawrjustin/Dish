# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name 'Lime Chicken'
    description 'A Gideon Chia classic'
    ingredients '1 lb of chicken, LOTS of lime juice, LOTS'
    directions 'Stir fry chicken, dump in LOADS and LOADS of lime juice'
    time_in_minutes '20'
    servings '5'
    total_cost '7'
  end
end
