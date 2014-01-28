default_categories = ["Automobiles", "Furniture", "Housing", "Misc", "All the weird dirty stuff that happens via Craigslist"]

default_categories.each do |category|
  Category.create(:title => category)
end