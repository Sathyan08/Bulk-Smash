FactoryGirl.define do
  factory :friendship do
    accepted false
    user
    association :friendee, factory: :friendee
  end
end
