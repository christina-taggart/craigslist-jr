def link_to_category(name)
	"<a href='\/categories/" + name + "'>" + name.gsub(/-/, " / ") + "</a>"
end

def link_to_post(post)
	"<a href='\/posts/" + post.id.to_s + "'>" + post.title + "</a>"
end

def link_to_edit_url(post)
	relative_link = "\/posts/#{post.id}/edit?key=" + post.edit_key
	"<a href='" + relative_link +  "'>" + "localhost:9292" + relative_link + "</a>"
end

def link_to_new_post_form(category)
	"<a href='\/posts/new?id=" + category.id.to_s + "'>" + "Create New Post" + "</a>"
end

