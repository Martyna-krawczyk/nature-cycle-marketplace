# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 10 standard users
for i in 1..10
  u = User.new(
    :email => Faker::Internet.email,
    :password => '123456',
    :file_id => rand(1..2)
    :admin => false
  )
  u.save!(:validate => false)
  Puts "Created #{i} users"
end

# Create 1 admin user
a = User.new(
    :email => Faker::Internet.email,
    :password => '123456',
    :file_id => rand(1..2)
    :admin => true
  )
  a.save!(:validate => false)
end

