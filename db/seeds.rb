# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 10 standard users
for i in 1..10
  user = User.create(
    :email => Faker::Internet.email,
    :password => '123456',
    :admin => false
  )
  puts "Created #{i} users"
end

# Create 1 admin user
admin_user = User.create(
    :email => 'admin@naturecycle.com',
    :password => '01234567',
    :admin => true
  )
  puts "Created one admin user admin@naturecycle.com with password 01234567"

# Creates 20 colours for Colours table
for i in 1..20
  colour = Colour.create(
    :colour => Faker::Color.color_name
  )
  puts "Created #{i} colours"
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
  Size.create(size: size)
  puts "Created #{size} colours"
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
  Make.create(make: make)
  puts "Created #{make} makes"
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
  Condition.create(condition: condition)
  puts "Created #{condition} condition"
end

## generating listings
prices = [
  25,
  35,
  45,
  65,
  75,
  80,
  55,
  125,
  20,
  15
]

titles = [
  'A fantastic bike for sale',
  'Great kids bike for sale would suit 5 year old',
  'Kids Bike in Great Used Condition',
  'Bicycle Purple and white 5-7 Year Olds Pre-owned In Great Condition',
  'Kids Bike 3 Gears  20" Wheels',
  'Kids bike BYK E250 with training wheels',
  'Royalbaby 12inch Girls Bikes Kids Push Bike Bicycle 12 inch Training Wheels Pink',
  'Trek Kids Bike'
]

descriptions = [
  "This is a ByK E-250 Kids Bike in Great Used Condition as you see in photos. It is a great bike to learn to ride on. It comes with training wheels and an adult support handle bar.",
  "Designed for 4-6 years old girls, but my daughter used it until 8yo. the E-350 provides comfort, is lightweight and has easy rolling wheels. Specially designed for the young female bodies, these bikes are perfect for your little angels.",
  "Kids Bike 3 Gears  20inch Wheels. Condition is Used with some wear and tear but in perfect working order.",
  "It is a great bike to learn to ride on. It comes with training wheels and a detachable adult support handle bar. Pick up only from Carlton North and cash on delivery is preferred.",
  "Radius kids bicycle. Condition is Used. Good working condition.",
  "Trek Kids Bike. Condition is Used but very good . For kid up to 8 years old."
]


colours = Colour.all
sample_colour = colours.map{|e| e[:id]}


makes = Make.all
sample_make = makes.map{|e| e[:id]}


sizes = Size.all
sample_size = sizes.map{|e| e[:id]}


locations = [ 
  "Melbourne, VIC",
  "Sydney, NSW",
  "Brisbane, QLD",
  "Darwin, NT",
  "Perth, WA",
  "Canberra, ATC",
  "Hobart, TAS" 
]

conditions = Condition.all
sample_condition = conditions.map{|e| e[:id]}

for i in 1..10
  images = ["bikeone.jpeg", "biketwo.jpeg", "bikethree.jpeg", "bikefour.jpeg", "bikefive.jpeg"]
  paths = ["app/assets/images/bikeone.jpeg", "app/assets/images/biketwo.jpeg", "app/assets/images/bikethree.jpeg", "app/assets/images/bikefour.jpeg", "app/assets/images/bikefive.jpeg"]
  index = (0..4).to_a.sample
  image = images[index]
  path = paths[index]

  
  listing = Listing.create(
    :user_id => rand(1..10).to_i,
    :title => titles.sample,
    :price => prices.sample.to_i,
    :deposit => 10.to_i,
    :description => descriptions.sample,
    :colour_id => sample_colour.sample.to_i,
    :make_id => sample_make.sample.to_i,
    :size_id => sample_size.sample.to_i,
    :sex => rand(0..2).to_i,
    :condition_id => sample_condition.sample.to_i,
    :location => locations.sample
  )
  listing.picture.attach(io: File.open(path), filename: image)
  listing.save
  
end
puts "Created 10 listings"