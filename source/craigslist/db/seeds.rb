require 'faker'

categories = [{name: "books"},
			  {name: "business"},
			  {name: "computer"},
			  {name: "free"},
			  {name: "wanted"},
			  {name: "casual-encounters"},
			  {name: "apts-housing"},
			  {name: "rooms-shared"},
			  {name: "sublets-temporary"},
			  {name: "housing-wanted"},
			  {name: "housing-swap"},
			  {name: "vacation-rentals"},
			  {name: "parking-storage"},
			  {name: "office-commercial"},
			  {name: "real-estate"}]

image_urls = ["http://i.imgur.com/6Lc9tt0.gif", "http://i.imgur.com/j2nx07p.gif", "http://i.imgur.com/nQPUa8x.gif", "http://i.imgur.com/VoSfyvA.jpg", "http://i.imgur.com/Sp4AVcm.png", "http://i.imgur.com/WzQOq9m.png"]


categories.each{ |attributes| Category.create(attributes) }

# Create posts and category ID
300.times do
	title = Faker::Lorem.sentence
	body = Faker::Lorem.paragraph
	email = Faker::Internet.email
	price = rand(1..400) * 100
	category_id = rand(categories.length) + 1
	image_url = image_urls.sample

	Post.create({title: title, body: body, email: email, category_id: category_id, price: price, image_url: image_url})
end