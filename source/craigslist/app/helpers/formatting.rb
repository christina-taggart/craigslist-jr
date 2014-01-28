def link_to_category(name)
	"<a href='\/categories/" + name + "'>" + name + "</a>"
end

def link_to_post(post)
	"<a href='\/posts/" + post.id.to_s + "'>" + post.title + "</a>"
end

def link_to_new_post_form(category)
	"<a href='\/posts/new?q" + category.name + "'>" + "Create New Post" + "</a>"
end