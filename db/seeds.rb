# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
file = Rails.root.join('app', 'assets', 'images', 'bike.jpg')

puts "destroying all Users"
User.destroy_all

puts "adding user"
User.create!(email: "dereuckkarmen@gmail.com", password: "123456", first_name: "kolawole", last_name: "akinmosin")
User.create!(email: "hello@gmail.com", password: "123456", first_name: "karmen", last_name: "South Africa" )
User.create!(email: "samuel@gmail.com", password: "123456", first_name: "leandro", last_name: "america")
User.create!(email: "paul@gmail.com", password: "123456", first_name: "paul", last_name: "Germany")

puts "Users created"

puts "destroying all bikes"
Bike.destroy_all

puts "adding bikes"
bike1 = Bike.create!(title: "Bike 1", price: 50, location: "London", user: User.first)
bike2 = Bike.create!(title: "Bike 2", price: 60, location: "Paris", user: User.second)
bike3 = Bike.create!(title: "Bike 3", price: 70, location: "London", user: User.third)
bike4 = Bike.create!(title: "Bike 4", price: 80, location: "Germany", user: User.last)
bike1.photos.attach(io: File.open(file), filename: "bike1.jpg", content_type: "image/png")
bike2.photos.attach(io: File.open(file), filename: "bike2.jpg", content_type: "image/png")
bike3.photos.attach(io: File.open(file), filename: "bike3.jpg", content_type: "image/png")
bike4.photos.attach(io: File.open(file), filename: "bike4.jpg", content_type: "image/png")
puts "Bikes created"
