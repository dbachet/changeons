FactoryGirl.define do
  sequence :color do |n|
    "color #{rand(10000 * n)}"
  end

  factory :category do
    name
    color
  end
end