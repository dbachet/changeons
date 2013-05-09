FactoryGirl.define do
  sequence :email do |n|
    "test_#{n}_#{rand(10000 * n)}@example.com"
  end
end