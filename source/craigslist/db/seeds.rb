require 'faker'

Category.create(name: "Cars")
Category.create(name: "Music")
Category.create(name: "Bikes")
Category.create(name: "Services")

def fake_post
  title = Faker::Lorem.sentence(word_count = 4)
  description = Faker::Lorem.paragraph(sentence_count = 4)
  price = rand(10000)
  secret_key = Faker::Lorem.characters(char_count = 9)
  lat = sprintf "%.6f", rand(30.0..50.0)
  lng = sprintf "%.6f", rand(-120.0..-90.0)
  {title: title, description: description, price: price,
  lat: lat, lng: lng, secret_key: secret_key}
end

100.times do
  rand_cat = Category.first(order: "RANDOM()")
  rand_cat.posts << Post.create(fake_post)
end


