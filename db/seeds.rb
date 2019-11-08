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
  Puts "Created #{i} users"
end

# Create 1 admin user
admin_user = User.crete(
    :email => Faker::Internet.email,
    :password => '01234567',
    :admin => true
  )
  Puts "Created one admin user #{:email} with password #{:password}"

# Creates 20 colours for Colours table
for i in 1..20
  colour = Colour.create(
    :colour => Faker::Color.color_name
  )
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
  Size.create(size: size)
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
  Make.create(make: make)
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
  Condition.create(condition: coldition)
  Puts "Created #{condition} condition"
end

## generating listings
price = [
  [25],
  [35],
  [45],
  [65],
  [75],
  [80],
  [55],
  [125],
  [20],
  [15],
]

titles = [
  ['A fantastic bike for sale'],
  ['Graet kid sbike for sale would suit 5 year old'],
  ['Kids Bike in Great Used Condition'],
  ['Bicycle Purple/white 5-7 Year Olds Pre-owned In Great Condition.'],
  ['Kids Bike 3 Gears  20" Wheels'],
  ['Kids bike BYK E250 with training wheels'],
  ['Royalbaby 12inch Girls Bikes Kids Push Bike Bicycle 12 inch Training Wheels Pink'],
  ['Trek Kids Bike']
]

descriptions = [
  ["This is a ByK E-250 Kids Bike in Great Used Condition as you see in photos. It is a great bike to learn to ride on. It comes with training wheels and an adult support handle bar."],
  ["Designed for 4-6 years old girls, but my daughter used it until 8yo. the E-350 provides comfort, is lightweight and has easy rolling wheels. Specially designed for the young female bodies, these bikes are perfect for your little angels."],
  ["Kids Bike 3 Gears  20inch Wheels. Condition is Used with some wear and tear but in perfect working order."],
  ["It is a great bike to learn to ride on. It comes with training wheels and a detachable adult support handle bar. Pick up only from Carlton North and cash on delivery is preferred."],
  ["Radius kids bicycle. Condition is Used. Good working condition."],
  ["Trek Kids Bike. Condition is Used but very good . For kid up to 8 years old."]
]

colours = Colour.all
sample_colour = colours.map{|e| e[:id]}

makes = Make.all
sample_make = makes.map{|e| e[:id]}

sizes = Size.all
sample_size = sizes.map{|e| e[:id]}

locations = [ 
  ["Melbourne, VIC"],
  ["Sydney, NSW"],
  ["Brisbane, QLD"],
  ["Darwin, NT"],
  ["Perth, WA"],
  ["Canberra, ATC"],
  ["Hobart, TAS"] 
]

conditions = Condition.all
sample_condition = conditions.map{|e| e[:id]}

images = ["bikeone.jpg", "biketwo.jpg", "bikethree.jpg", "bikefour.jpg", "bikefive.jpg"]
paths = ["app/assets/images/bikeone.jpeg", "app/assets/images/biketwo.jpeg", "app/assets/images/bikethree.jpeg", "app/assets/images/bikefour.jpeg", "app/assets/images/bikefive.jpeg"]
index = (1..5).to_a.sample
file = files[index]
path = paths[index]

for i in 1..10
  listing = Listing.create(
    :title => titles.to_s.sample
    :price => price.to_a.sample
    :deposit => 10
    :description => descriptions.to_s.sample
    :colour_id => sample_colour.sample
    :make_id => sample_make.sample
    :size_id => sample_size.sample
    :sex => rand(0..2)
    :condition_id => sample_condition.sample
    :location => locations.sample
  )
  listing.picture.attach(io: File.open(path), filename: file)
  listing.save
  Puts "Created 10 listings"

end