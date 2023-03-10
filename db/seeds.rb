# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Beginning seed..."
# product = Product.new(
#   name: Faker::Commerce.product_name,
#   price: Faker::Commerce.price,
#   image_url: Faker::Internet.url,
#   description: Faker::Commerce.material,
# )
10.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    image_url: Faker::Internet.url,
    description: Faker::Commerce.material,
  )
  product.save
end

puts "Seeding finished!"
