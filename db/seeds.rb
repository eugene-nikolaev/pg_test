# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Customer.destroy_all
Operator.destroy_all

UMBRELLA   = Customer.create!(name: "Umbrella")
NORTH_STAR = Customer.create!(name: "North Star")
User.create!(email: "alice@example.com", name: "Alice", customer_id: UMBRELLA.id, password: "password")
User.create!(email: "bob@example.com",   name: "Bob",   customer_id: NORTH_STAR.id, password: "password")
Operator.create!(email: "chuck@example.com", name: "Chuck", password: "password")