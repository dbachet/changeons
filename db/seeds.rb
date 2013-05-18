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

user = User.find_by(email: ENV['ADMIN_EMAIL'])
user = User.create(email: ENV['ADMIN_EMAIL'].dup, password: ENV['ADMIN_PWD'].dup, name: ENV['ADMIN_NAME'].dup) unless user
user.add_role(User::ROLES.last)

