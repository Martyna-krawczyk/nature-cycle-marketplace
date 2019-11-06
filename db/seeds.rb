# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 10 standard users
for i in 1..10
  user = User.new(
    :email => Faker::Internet.email,
    :password => '123456',
    :file_id => rand(1..2),
    :admin => false
  )
  user.save!(:validate => false)
  Puts "Created #{i} users"
end

# Create 1 admin user
admin_user = User.new(
    :email => Faker::Internet.email,
    :password => '01234567',
    :file_id => rand(1..2),
    :admin => true
  )
  admin_user.save!(:validate => false)
  Puts "Created one admin user"

# Creates 20 colours for Colours table
for i in 1..20
  colour = Colour.new(
    :colour => Faker::Color.color_name,
    :file_id => rand(1..2)
  )
  colour.save!(:validate => false)
  Puts "Created #{i} colours"
end

# Creates 6 sizes for Sizes table - measured as child's height
size_list = [
  ['85cm to 100cm'],
  ['95cm to 110cm'],
  ['110cm to 120cm'],
  ['120cm to 135cm'],
  ['135cm to 145cm'],
  ['135cm to 145cm']
]
size_list.each do |size|
  Size.new(size: size)
  size.save!(:validate => false) 
  Puts "Created #{size} colours"
end

# Creates 8 makes for Makes table
makes_list = [
  ['Giant'],
  ['Mongoose'],
  ['Liv'],
  ['Goldcross'],
  ['Polygon'],
  ['Fluid'],
  ['Huffy'],
  ['Royal Baby']
]
makes_list.each do |make|
  Make.new(make: make)
  make.save!(:validate => false) 
  Puts "Created #{make} makes"
end

# Creates 6 conditions for Conditions table
conditions_list = [
  ['New'],
  ['As-New'],
  ['Excellent'],
  ['Good'],
  ['Poor'],
  ['Suitable for parts only']
]
conditions_list.each do |condition|
  Condition.new(condition: coldition)
  condition.save!(:validate => false) 
  Puts "Created #{condition} condition"
end


