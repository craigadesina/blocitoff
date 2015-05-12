# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

require 'faker'

# include 'faker'

# Create users:

100.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create items:

600.times do
item = Item.create(
  name: Faker::Lorem.sentence,
  user: users.sample
  )
  end

  items = Item.all
  #password_confirmation: :password) 

# Create an default user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   )
 admin.skip_confirmation!
 admin.save!

 

 puts "#{User.count} users created"

 puts "#{Item.count} items created"

 puts "That was a fucking helluva lotta seeds to spray about, bro!!"



#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
