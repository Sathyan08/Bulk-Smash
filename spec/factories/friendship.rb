FactoryGirl.define do
  factory :friendship do
    accepted false
    user
    association :friendee, factory: :friend
  end
end
