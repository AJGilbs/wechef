# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all"
Restaurant.destroy_all
Chef.destroy_all

puts "Creating..."

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


nathalia = Chef.new(email: "hello@nathalia.com", password: '123456', name: "Nathalia de Luccas", address: "144, Liverpool Road", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
nathalia.save!
cris = Chef.new(email: "hello@cris.com", password: '123456', name: "Cris Hdo", address: "433, London", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
cris.save!
david = Chef.new(email: "hello@david.com", password: '123456', name: "David Rossiter", address: "9 Barge Walk, Greenwich", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
david.save!
khaled = Chef.new(email: "hello@khaled.com", password: '123456', name: "Khaled McGonnell", address: "123, McGonnell Drive", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
khaled.save!
joe = Chef.new(email: "hello@joe.com", password: '123456', name: "Joe Running", address: "1 Running Street", phone_number: "02080000000", photo: "https://d3g919u5f14ld1.cloudfront.net/assets/images/users/default-avatar.svg")
joe.save!

puts "Completed"
