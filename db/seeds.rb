# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all Users"
User.destroy_all

puts "adding user"
User.create!(email: "dereuckkarmen@gmail.com", password: "123456")
User.create!(email: "hello@gmail.com", password: "123456")
User.create!(email: "samuel@gmail.com", password: "123456")
User.create!(email: "paul@gmail.com", password: "123456")

puts "Users created"

puts "destroying all bikes"
Bike.destroy_all

puts "adding bikes"
Bike.create!(title: "Bike 1", price: 50, location: "London", user: User.first)
Bike.create!(title: "Bike 2", price: 60, location: "Paris", user: User.second)
Bike.create!(title: "Bike 3", price: 70, location: "London", user: User.third)
Bike.create!(title: "Bike 4", price: 80, location: "Germany", user: User.last)

puts "Bikes created"
