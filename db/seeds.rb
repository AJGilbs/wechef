# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all"
Message.destroy_all
Request.destroy_all
ReviewsChef.destroy_all
Booking.destroy_all
Restaurant.destroy_all
Position.destroy_all
Chef.destroy_all

puts "Creating..."

#Restaurants
sketch = Restaurant.new(email: "hello@sketch.com", password: '123456', name: "Sketch", address: "Sketch, London", phone_number: "02080000000", photo: "https://i.pinimg.com/736x/52/96/5d/52965dcbd26099f65658ecd3bcc7d840--restaurant-food-sketch-restaurant.jpg")
sketch.save!
hawksmoor = Restaurant.new(email: "hello@hawksmoor.com", password: '123456', name: "Kawsmoor", address: "Hawksmoor, Shoreditch", phone_number: "02080000000", photo: "https://i.pinimg.com/736x/52/96/5d/52965dcbd26099f65658ecd3bcc7d840--restaurant-food-sketch-restaurant.jpg")
hawksmoor.save!
bao = Restaurant.new(email: "hello@bao.com", password: '123456', name: "Bao", address: "Bao, London", phone_number: "02080000000", photo: "https://i.pinimg.com/736x/52/96/5d/52965dcbd26099f65658ecd3bcc7d840--restaurant-food-sketch-restaurant.jpg")
bao.save!
ceviche = Restaurant.new(email: "hello@cevichesoho.com", password: '123456', name: "Ceviche Soho", address: "Ceviche Soho, London", phone_number: "02080000000", photo: "https://i.pinimg.com/736x/52/96/5d/52965dcbd26099f65658ecd3bcc7d840--restaurant-food-sketch-restaurant.jpg")
ceviche.save!
hoppers = Restaurant.new(email: "hello@hoppers.com", password: '123456', name: "Hoppers", address: "Hoppers, London", phone_number: "02080000000", photo: "https://i.pinimg.com/736x/52/96/5d/52965dcbd26099f65658ecd3bcc7d840--restaurant-food-sketch-restaurant.jpg")
hoppers.save!

puts 'Restaurants are created'

nathalia = Chef.new(email: "hello@nathalia.com", password: '123456', name: "Nathalia de Luccas", price: 200, address: "144, Liverpool Road", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
nathalia.remote_photo_url = "https://avatars1.githubusercontent.com/u/3418144?s=460&v=4"
nathalia.save!
cris = Chef.new(email: "hello@cris.com", password: '123456', name: "Cris Hdo", price: 85, address: "433, London", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
cris.remote_photo_url = "https://avatars0.githubusercontent.com/u/30732497?s=460&v=4"
cris.save!
david = Chef.new(email: "hello@david.com", password: '123456', name: "David Rossiter", price: 90, address: "9 Barge Walk, Greenwich", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
david.remote_photo_url = "https://avatars2.githubusercontent.com/u/26829404?s=460&v=4"
david.save!
khaled = Chef.new(email: "hello@khaled.com", password: '123456', name: "Khaled McGonnell", price: 100, address: "123, McGonnell Drive", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
khaled.remote_photo_url = "https://avatars1.githubusercontent.com/u/3418144?s=460&v=4"
khaled.save!
joe = Chef.new(email: "hello@joe.com", password: '123456', name: "Joe Running", price: 50, address: "1 Running Street", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
joe.remote_photo_url = "https://avatars1.githubusercontent.com/u/3418144?s=460&v=4"
joe.save!

puts 'Chefs are created'

# ["Executive Chef", "Head Chef", "Sous Chef", "Chef de Partie", "Commis Chef"]
nathalia.positions.create!(restaurant_name: 'Sketch', title: "Executive Chef", start_date: Date.today - 10.years, end_date: Date.today - 8.years)
nathalia.positions.create!(restaurant_name: 'Bao', title: "Head Chef", start_date: Date.today - 8.years, end_date: Date.today - 5.years)
nathalia.positions.create!(restaurant_name: 'Ceviche', title: "Sous Chef", start_date: Date.today - 5.years, end_date: Date.today)

cris.positions.create!(restaurant_name: 'Ceviche', title: "Sous Chef", start_date: Date.today - 5.years, end_date: Date.today - 3.years)
cris.positions.create!(restaurant_name: 'Sketch', title: "Head Chef", start_date: Date.today - 3.years, end_date: Date.today)

david.positions.create!(restaurant_name: 'Hoppers', title: "Executive Chef", start_date: Date.today - 6.years, end_date: Date.today - 3.years)
david.positions.create!(restaurant_name: 'Bao', title: "Chef de Partie", start_date: Date.today - 3.years, end_date: Date.today)

khaled.positions.create!(restaurant_name: 'Bao', title: "Head Chef", start_date: Date.today - 10.years, end_date: Date.today - 5.years)
khaled.positions.create!(restaurant_name: 'Hoppers', title: "Commis Chef", start_date: Date.today - 5.years, end_date: Date.today - 2.years)
khaled.positions.create!(restaurant_name: 'Sketch', title: "Executive Chef", start_date: Date.today - 2.years, end_date: Date.today)

joe.positions.create!(restaurant_name: 'Ceviche', title: "Chef de Partie", start_date: Date.today - 8.years, end_date: Date.today - 4.years)
joe.positions.create!(restaurant_name: 'Hoppers', title: "Executive Chef", start_date: Date.today - 4.years, end_date: Date.today - 2.years)
joe.positions.create!(restaurant_name: 'Sketch', title: "Sous Chef", start_date: Date.today - 2.years, end_date: Date.today - 1.years)
joe.positions.create!(restaurant_name: 'Kawsmoor', title: "Head Chef", start_date: Date.today - 1.years, end_date: Date.today)

puts 'Positions are created'

position = Position.new(title: "Executive Chef", restaurant_name: "The Pig and the Bucher", description: "Best days of my life", start_date: Date.today, end_date: Date.today)
position.chef = nathalia
position.save!
position = Position.new(title: "Head Chef", restaurant_name: "The Pig and the Bucher", description: "Best days of my life", start_date: Date.today, end_date: Date.today)
position.chef = nathalia
position.save!

position = Position.new(title: "Head Chef", restaurant_name: "Mishoom", description: "Best days of my life", start_date: Date.today, end_date: Date.today)
position.chef = cris
position.save!

position = Position.new(title: "Sous Chef", restaurant_name: "The Pig and the Bucher", description: "Best days of my life", start_date: Date.today, end_date: Date.today)
position.chef = david
position.save!

position = Position.new(title: "Sous Chef", restaurant_name: "The Pig and the Bucher", description: "Best days of my life", start_date: Date.today, end_date: Date.today)
position.chef = khaled
position.save!

puts 'Positions are created'

booking = Booking.new(date: Date.today, start_hours: 13, end_hours: 20)
booking.restaurant = sketch
booking.chef = nathalia
booking.save!
booking = Booking.new(date: Date.today, start_hours: 6, end_hours: 14)
booking.restaurant = hawksmoor
booking.chef = cris
booking.save!
booking = Booking.new(date: Date.today, start_hours: 14, end_hours: 22)
booking.restaurant = bao
booking.chef = david
booking.save!
booking = Booking.new(date: Date.today, start_hours: 15, end_hours: 23)
booking.restaurant = ceviche
booking.chef = khaled
booking.save!
booking = Booking.new(date: Date.today, start_hours: 13, end_hours: 23)
booking.restaurant = hoppers
booking.chef = joe
booking.save!

puts 'Bookings are created'

# Requests
request_sketch = Request.new(date: Date.today, number_of_chefs: 2, description: "Please bring your knives and hat", start_hours: Time.now, end_hours: Time.now + 1*60*60)
request_sketch.restaurant = sketch
request_sketch.chef_ids = [nathalia.id]
request_sketch.save!
request_hawksmoor = Request.new
request_hawksmoor = Request.new(date: Date.today, number_of_chefs: 1, description: "Use backdoor to enter the restaurant", start_hours: Time.now, end_hours: Time.now + 1*60*60)
request_hawksmoor.restaurant = hawksmoor
request_hawksmoor.chef_ids = [cris.id]
request_hawksmoor.save!
request_bao = Request.new(date: Date.today, number_of_chefs: 3, description: "Bring chefs white and hat ", start_hours: Time.now, end_hours: Time.now + 1*60*60)
request_bao.restaurant = bao
request_bao.chef_ids = [david.id]
request_bao.save!
request_ceviche = Request.new(date: Date.today, number_of_chefs: 1, description: "no need knives or uniform", start_hours: Time.now, end_hours: Time.now + 1*60*60)
request_ceviche.restaurant = ceviche
request_ceviche.chef_ids = [khaled.id]
request_ceviche.save!
request_hoppers = Request.new(date: Date.today, number_of_chefs: 2, description: "Please bring your knives", start_hours: Time.now, end_hours: Time.now + 1*60*60)
request_hoppers.restaurant = hoppers
request_hoppers.chef_ids = [joe.id]
request_hoppers.save!

puts 'Requests are created'

conversation1 = Conversation.create!(request: request_sketch, restaurant: sketch, chef: nathalia)
conversation2 = Conversation.create!(request: request_bao, restaurant: bao, chef: david)
conversation3 = Conversation.create!(request: request_hoppers, restaurant: hoppers, chef: joe)
conversation4 = Conversation.create!(request: request_ceviche, restaurant: ceviche, chef: khaled)
conversation5 = Conversation.create!(request: request_bao, restaurant: bao, chef: david)
conversation6 = Conversation.create!(request: request_hawksmoor, restaurant: hawksmoor, chef: cris)

puts 'Conversations are created'


# Messages
message = Message.new(body: "can you make it tomorrow?" )
message.author = sketch
message.conversation = conversation1
message.save!
message = Message.new(body: "yes!" )
message.author = david
message.conversation = conversation1
message.save!
message = Message.new(body: "can you make it tomorrow?" )
message.author = bao
message.conversation = conversation2
message.save!
message = Message.new(body: "yes!" )
message.author = joe
message.conversation = conversation2
message.save!

puts "Completed"
