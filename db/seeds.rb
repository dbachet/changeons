# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(User::ROLES).each do |name|
  Role.create!(name: name) unless Role.where(name: name).exists?
end

user = User.create!(email: ENV['admin_email'], name: ENV['admin_name'], password: ENV['admin_pwd'])
user.add_role(User::ROLES.last)

