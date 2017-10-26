# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'yaml'
data = YAML.load_file('db/restaurants.yml')

menus = data["menus"]
foods = data["foods"]

puts "Destroying Foods"
Food.destroy_all
puts "Destroying Menus"
Menu.destroy_all
puts "Destroying Restaurants"
Restaurant.destroy_all
# puts "Destroying Users"
# User.destroy_all

puts "Creating Restaurants"

restaurants = data["restaurants"]
puts "    This are all the restaurants we will create"
restaurants.each_with_index do |data, index|
  puts "    #{index +1} - #{data[0]}"
  restaurant = Restaurant.new
  restaurant.name = data[1]["name"]
  restaurant.description = data[1]["description"]
  restaurant.address = data[1]["address"]
  restaurant.phone = data[1]["phone"]
  restaurant.instagram = data[1]["instagram"]
  restaurant.email = data[1]["email"]
  restaurant.website = data[1]["website"]
  restaurant.save!
end

puts "Done creating Restaurants"

puts "Creating Menus"

Restaurant.all.each do |restaurant|
  # getting a menu randomly
  k = menus.keys.sample
  menu = Menu.new
  menu.name = menus[k]["name"]
  menu.description = menus[k]["description"]
  menu.restaurant_id = restaurant.id
  menu.save!
end

puts "Done creating Menus"

puts "Creating Foods"

Menu.all.each do |menu|
  rand(3..5).times do
    # getting a food randomly
    k = foods.keys.sample

    food = Food.new
    food.name = foods[k]["name"]
    food.description = foods[k]["description"]
    food.price = foods[k]["price"]
    food.menu_id = menu.id
    food.save!
  end
end
puts "Done creating Foods"




