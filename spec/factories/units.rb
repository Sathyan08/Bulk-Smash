FactoryGirl.define do
  factory :unit do
    name 'test_unit'
  end

  factory :pound, class: Unit do
    name 'pound'
  end
end
