FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "generic_email#{n}@gmail.com" }
    password 'secret123'
    password_confirmation 'secret123'
  end

  factory :friend, class: User do
    sequence(:email) { |n| "friend#{n}@gmail.com" }
    password 'friend_secret_123'
    password_confirmation 'friend_secret_123'
  end
end
