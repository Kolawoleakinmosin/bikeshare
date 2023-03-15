# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
file = Rails.root.join('app', 'assets', 'images', 'electric_bike.jpg')
file2 = Rails.root.join('app', 'assets', 'images', 'city_slicker.jpg')
file3 = Rails.root.join('app', 'assets', 'images', 'bike.jpg')
file4 = Rails.root.join('app', 'assets', 'images', 'mountain_bike.jpg')


puts "destroying all Users"
User.destroy_all

puts "adding user"
User.create!(email: "dereuckkarmen@gmail.com", password: "123456", first_name: "Karmen", last_name: "de Reuck")
User.create!(email: "hello@gmail.com", password: "123456", first_name: "Samuel", last_name: "Akinmosin")
User.create!(email: "samuel@gmail.com", password: "123456", first_name: "Leandro", last_name: "Costa")
User.create!(email: "paul@gmail.com", password: "123456", first_name: "Paul", last_name: "Hempel")

puts "Users created"

puts "destroying all bikes"
Bike.destroy_all

puts "adding bikes"
bike1 = Bike.create!(title: "Electric bike", price: 90, location: "Belsize Park", user: User.first)
bike2 = Bike.create!(title: "City slicker", price: 60, location: "Shoreditch", user: User.second)
bike3 = Bike.create!(title: "Lovely park bike", price: 70, location: "Chelsea", user: User.third)
bike4 = Bike.create!(title: "Mountain bike", price: 80, location: "Southwark", user: User.last)
bike1.photos.attach(io: File.open(file), filename: "bike1.jpg", content_type: "image/png")
bike2.photos.attach(io: File.open(file2), filename: "bike2.jpg", content_type: "image/png")
bike3.photos.attach(io: File.open(file3), filename: "bike3.jpg", content_type: "image/png")
bike4.photos.attach(io: File.open(file4), filename: "bike4.jpg", content_type: "image/png")
puts "Bikes created"
