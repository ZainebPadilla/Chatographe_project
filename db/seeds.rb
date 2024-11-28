# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# db/seeds.rb

# Listes d'adjectifs, races de chat, et actions
adjective = ["mignon", "joueur", "doux", "câlin", "curieux", "énergique", "gracieux", "majestueux"]
breed_cat = ["Siamois", "Persan", "Sphynx", "Abyssin", "Burmese", "Sacré de Birmanie", "Maine Coon"]
actions = ["joue avec une balle", "dort", "observe", "s'étire", "chasse", "se prélasse au soleil", "explore son environnement", "fait sa toilette", "ronronne doucement"]

# Suppression de tous les éléments existants avant de recréer les nouveaux
Item.destroy_all

# Liste d'URLs d'images de chats provenant de Pixabay ou d'autres sources
photo_urls = [
  'https://cdn.pixabay.com/photo/2024/03/07/10/38/simba-8618301_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/05/14/21/43/british-shorthair-3401683_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/03/26/02/05/cat-3261420_640.jpg',
  'https://cdn.pixabay.com/photo/2016/05/05/13/10/young-1373879_640.jpg',
  'https://cdn.pixabay.com/photo/2023/03/05/18/40/cat-7832036_640.png',
  'https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_640.jpg',
  'https://cdn.pixabay.com/photo/2021/08/27/10/16/cat-6578336_640.jpg',
  'https://cdn.pixabay.com/photo/2019/04/02/16/11/cat-4098058_1280.jpg'
]

# Créer 20 chats avec des titres, des descriptions, des prix et des photos aléatoires
8.times do |i|
  Item.create!(
    title: "Chaton mignon #{i + 1}",
    description: "Un #{adjective.sample} chaton #{breed_cat.sample} qui #{actions.sample}.",
    price: rand(5.0..50.0).round(2),
    image_url: photo_urls[i % photo_urls.length]  # Répartir les images sur les 20 chats
  )
end

puts "8 chatons ont été créés avec succès !"