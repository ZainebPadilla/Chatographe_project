# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
adjectives = ["mignon", "joueur", "doux", "câlin", "curieux", "énergique", "gracieux", "majestueux"]
breed_cats = ["Siamois", "Persan", "Sphynx", "Abyssin", "Burmese", "Sacré de Birmanie", "Marine coon"]
actions = ["joue avec une balle", "dort", "observe", "s'étire", "chasse", "se prélasse au soleil", "explore son environnement", "fait sa toilette", "ronronne doucement"]

Item.destroy_all

20.times do |i|
  
  adjective = adjectives.sample
  breed = breed_cats.sample
  action = actions.sample

  
  Item.create!(
    title: "Chaton mignon #{i + 1}",
    description: "Un #{adjective} chaton #{breed} qui #{action}.",
    price: rand(5.0..50.0).round(2),
    image_url: "https://pixabay.com/fr/images/search/chaton/#{200 + i}" #site photo de chat i + 1
    )

end

puts "chaton créé"