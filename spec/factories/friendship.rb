FactoryGirl.define do
  factory :friendship do
    user
    association :friendee, factory: :friend
  end
end
