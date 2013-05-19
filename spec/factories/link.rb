FactoryGirl.define do
  sequence :url do |n|
    "http://#{rand(10000 * n)}.com"
  end

  factory :link do
    name
    url
    language 'FR'
    category
  end
end