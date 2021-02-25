# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'rest-client'
require 'open-uri'

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Shop.destroy_all

puts "Creating shops..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE"}
pizza_east = { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ"}

[ dishoom, pizza_east ].each do |attributes|
  shop = Shop.create!(attributes)
  puts "Created #{shop.name}"
end
puts "Finished!"





