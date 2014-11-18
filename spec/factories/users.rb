FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "generic_email#{n}@gmail.com" }
    password 'secret123'
    password_confirmation 'secret123'
  end
end
