categories = File.read('db/categories.txt').split("\n")

categories.each do |cat|
  p cat
  Category.create({name: cat})
end
