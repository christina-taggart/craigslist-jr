require 'faker'
module DataImporter
  class CategorySeeder
    def self.import
      12.times { Category.create({title: Faker::Company.name}) }
    end
  end


  class PostSeeder
    def self.import
      100.times {
        Post.create({
          category_id: generate_random_category_id,
          description: Faker::Lorem.sentences(sentence_count = 60, supplemental = false),
          title: Faker::Company.bs,
          price: generate_random_price,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          email: Faker::Internet.email
        })
      }
    end

    def self.generate_random_category_id
      rand(1..12)
    end

    def self.generate_random_price
      rand(1000..9999) / 100.0
    end
  end
end