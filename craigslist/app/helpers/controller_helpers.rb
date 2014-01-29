def get_ordered_category_list(category)
	categories = Category.all
	categories.insert(0, categories.delete(category))
end