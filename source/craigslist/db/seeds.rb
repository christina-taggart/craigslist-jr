require 'csv'
require_relative '../config/database'
require_relative '../config/environment'
require_relative '../app/models/category'
require_relative '../app/models/post'

class SeedCategories
  def self.seed
    basic_categories = ["Apartments", "Vehicles", "Household Goods",
                        "Sporting Goods", "Groceries"]
    basic_categories.each { |category_name| Category.create(name: category_name) }
  end
end

class SeedPosts
  def self.seed
    csv_text = File.read('db/posts.csv')
    posts_csv = CSV.parse(csv_text, :headers => true)
    posts_csv.each { |row| Post.create(row.to_hash) }
  end
end

SeedCategories.seed
SeedPosts.seed