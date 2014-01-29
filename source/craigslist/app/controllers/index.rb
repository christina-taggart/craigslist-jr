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

post '/post' do
	@title = params[:title]
	@post_content = params[:listing]
	@price = params[:price]
	@location = params[:location]
	@category = params[:category]
	@email = params[:email]
	@category_id = Category.where("title = ?", @category)[0][:id]
	@secret_id = rand(10000).to_s
	Post.create(	:title => @title,
						:post_content => @post_content,
						:price => @price,
						:location => @location,
						:category_id => @category_id,
						:email => @email,
						:secret_id => @secret_id)
  
	erb :after_post, locals: {secret_id: @secret_id}
end

get '/post/:secret_id/edit' do 
	@category_names = Category.all.map {|category| category[:title]}
	erb :post, locals: {secret_id: @secret_id} 
end

post '/post/:secret_id/edit' do
	@post = Post.where("secret_id = ?", params[:secret_id])[0]

	@post.update_attributes(title: params[:title], post_content: params[:post_content], price: params[:price], location: params[:location], category_id: params[:category_id], email: params[:email])
	erb :index
end

get '/:category' do
	erb :view_posts, locals: {category: params[:category]}
end

# get '/Furniture' do
# 	erb :view_posts, locals: {category: "Furniture"}
# end

# get '/Housing' do
# 	erb :view_posts, locals: {category: "Housing"}
# end

# get '/Misc' do
# 	erb :view_posts, locals: {category: "Misc"}
# end

# get '/All%20the%20weird%20dirty%20stuff%20that%20happens%20via%20Craigslist' do
# 	erb :view_posts, locals: {category: "All the weird dirty stuff that happens via Craigslist"}
# end


# get category
# shows all posts for that category

# post category
# redirect to create_post page
# create a new post for this category

# put category/post
# updates a post with new info

# delete post
# deletes a given post