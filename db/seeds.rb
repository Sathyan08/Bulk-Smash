# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
first_user = User.new

first_user.email = 'first@gmail.com'
first_user.password = 'secret_password'
first_user.password_confirmation = 'secret_password'

first_user.save!
