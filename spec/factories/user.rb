FactoryGirl.define do
  factory :user do
    email
    password 'testtest'
    password_confirmation 'testtest'

    trait :admin do
      before(:create) do |user, evaluator|
        user.add_role :admin
      end
    end
  end
end