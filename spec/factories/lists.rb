FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "test_list#{n}" }
    user
  end
end
