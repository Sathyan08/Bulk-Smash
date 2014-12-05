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

def populate_units
  unit_names = ["Pound", "(12 oz.) Can", "Ounces"]
  unit_names.each { |name| Unit.create!( {name: name}) }
end

def populate_foods
  foods = [ {name: 'Chicken', unit: Unit.find_by(name: "Pound")},
            {name: 'Coke', unit: Unit.find_by(name: "(12 oz.) Can")},
            {name: 'Cereal', unit: Unit.find_by(name: "Ounces")}
  ]

  foods.each { |food| Food.create(food) }
end

def populate_users

end
