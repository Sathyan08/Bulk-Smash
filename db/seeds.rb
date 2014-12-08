# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
first_user = FactoryGirl.create(:user)

unit_names = ["Pound", "(12 oz.) Can", "Ounces"]
unit_names.each { |name| Unit.create!( {name: name}) }

foods = [ {name: 'Chicken', unit: Unit.find_by(name: "Pound")},
            {name: 'Coke', unit: Unit.find_by(name: "(12 oz.) Can")},
            {name: 'Cereal', unit: Unit.find_by(name: "Ounces")}
  ]

foods.each { |food| Food.create(food) }

list = FactoryGirl.build(:list)
list.user = first_user
list.save

chicken = ListItem.new(food: Food.find_by(name: 'Chicken'))
chicken.amount = 5
chicken.list = list
chicken.save

coke = ListItem.new(food: Food.find_by(name: 'Coke'))
coke.amount = 32
coke.list = list
coke.save

counter = 0

5.times do
  counter += 1

  user = FactoryGirl.create(:user)
  friendship = FactoryGirl.build(:friendship)
  friendship.friendee = first_user
  friendship.user = user
  friendship.accepted = true
  friendship.save

  list = FactoryGirl.build(:list)
  list.user = user
  list.save

  chicken = ListItem.new(food: Food.find_by(name: 'Chicken'))
  chicken.amount = 5
  chicken.list = list
  chicken.save

  if counter % 2 != 0
    coke = ListItem.new(food: Food.find_by(name: 'Coke'))
    coke.amount = 32
    coke.list = list
    coke.save
  end
end

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

def populate_users_and_friendships
  5.times do
    user = FactoryGirl.create(:user)
    friendship = FactoryGirl.build(:friendship)
    friendship.friendee = first_user
    friendship.user = user
    friendship.accepted = true
    friendship.save

    list = FactoryGirl.build(:list)
    list.user = user
    list.save

    chicken = ListItem.find_by(name: 'Chicken')
    chicken.amount = 5
    chicken.list = list
    chicken.user = user
    chicken.save
  end
end
