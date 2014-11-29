FactoryGirl.define do
  factory :food do
    sequence(:name) { |n| "test_food#{n}" }
    association :unit, factory: :unit
  end

  factory :chicken, class: Unit do
    name 'chicken'
    association :unit, factory: :pound
  end
end
