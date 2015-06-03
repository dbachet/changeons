FactoryGirl.define do
  sequence :remote_id do |n|
    rand(10000 * n)
  end

  factory :tweet do
    remote_id
  end
end