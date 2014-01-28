get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/categories' do
  @category_names = Category.all.map {|category| category[:title]}
  erb :category
end

get '/post' do
  @category_names = Category.all.map {|category| category[:title]}
  erb :post
end

# get category
# shows all posts for that category

# post category
# redirect to create_post page
# create a new post for this category

# put category/post
# updates a post with new info

# delete post
# deletes a given post