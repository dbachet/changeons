# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user     = User.create_with(email: 'test@test.com', password: 'testtest').where(email: 'test@test.com').first_or_create!
category = Category.where(name: "Alimentation").first_or_create!

tweet = Tweet.where(remote_id: "697572954855624705").first_or_create!
link = Link.where(
  name: "Contre le gaspillage alimentaire, l'appli qui géolocalise les invendus.",
  url: "http://www.optimiam.com/",
  language: "FR",
  category: category,
  user: user
).first_or_create!

