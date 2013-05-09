FactoryGirl.define do
  factory :user do
    email
    password 'testtest'
    password_confirmation 'testtest'

    trait :admin do
      after(:create) do |user, evaluator|
        user.add_role :admin
      end
    end

    trait :member do
      after(:create) do |user, evaluator|
        user.add_role :member
      end
    end
  end
end