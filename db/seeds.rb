# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "json"
require "faker"


filepath = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(filepath).read

ingredients = JSON.parse(serialized_ingredients)

puts "Creating ingredients..."
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
p "done"

photos = ["http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535853/cocktail2_rxl1k3.png", "http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535852/cocktail3_xbehbu.png", "http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535852/cocktail4_c3ygiu.png", "http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535853/cocktail5_wozacf.png", "http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535852/cocktail6_smlb32.png", "http://res.cloudinary.com/dxlfgmaxy/image/upload/v1511535853/cocktail7_sb9xpi.png"]

p "Creating cocktails"
15.times do
  cocktail = Cocktail.new(name: Faker::Hipster.words(2, false, true).join(" ").capitalize)
  cocktail.remote_photo_url = photos.sample
  cocktail.save
end
p "done-zo"


