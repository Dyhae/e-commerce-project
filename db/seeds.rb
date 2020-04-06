# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

# Product.destroy_all
# Addresslist.destroy_all
# Orderproductlist.destroy_all
# User.destroy_all
# Order.destroy_all
# Address.destroy_all
# Province.destroy_all
# State.destroy_all
# Category.destroy_all
# Status.destroy_all

# myArray = ['New', 'On Sale']
# myArray.each do |p|
#   state = State.find_or_create_by(name: p)
#   state.save

#   csv_text = File.read(Rails.root.join('lib', 'seeds', 'card_csvfile.csv'))
#   csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
#   csv.each do |row|
#     puts row.to_hash
#     category = Category.find_or_create_by(name: row['Make'])
#     category.save
#     price = rand(1000.00..120_000.00)
#     product = Product.find_or_create_by(model: row['Model'])
#     product.color = Faker::Vehicle.color
#     product.transmission = Faker::Vehicle.transmission
#     product.car_description = Faker::Vehicle.standard_specs[0]
#     product.car_option = Faker::Vehicle.car_options[0]
#     product.price = price
#     product.sale_percentage = 0.0
#     product.quantity_in_stock = 1
#     product.state = state
#     product.category = category
#     product.save
#   end
# end

myArray = ['New', 'On Sale']
myArray.each do |p|
  state = State.find_or_create_by(name: p)
  state.save

  7.times do
    category = Category.find_or_create_by(name: Faker::Vehicle.make)
    category.save
    20.times do
      price = rand(1000.00..120_000.00)
      price = price.round(2)
      product = Product.find_or_create_by(model: Faker::Vehicle.model(make_of_model: category.name))
      product.color = Faker::Vehicle.color
      product.transmission = Faker::Vehicle.transmission
      product.car_description = Faker::Vehicle.standard_specs[0]
      product.car_option = Faker::Vehicle.car_options[0]
      product.price = price
      product.sale_percentage = 0.0
      product.quantity_in_stock = 1
      product.state = state
      product.category = category
      product.save
    end
  end
rescue StandardError => e
  puts e.message
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
