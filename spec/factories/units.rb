FactoryGirl.define do
  factory :unit do
    sequence(:name) { |n| "test_unit#{n}" }
  end

  factory :pound, class: Unit do
    name 'pound'
  end
end
