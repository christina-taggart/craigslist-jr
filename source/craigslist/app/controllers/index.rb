enable :sessions

get '/' do
  @categories = Category.all
  erb :categories
end

get "/:category" do
  puts "just_created: #{@just_created}"
  @category = Category.find_by_category_name(get_category_name(params[:category]))
  @posts = @category.posts.sort_by{ |post| post.updated_at }.reverse
  if session[:post_id]
    @new_post = Post.find(session[:post_id])
    session.clear
  end
  erb :posts
end

get "/:category/post/new" do
  @category = Category.find_by_category_name(params[:category])
  erb :create_post
end

post "/:category/post/new" do
	params[:post][:price] = string_to_price(params[:post][:price])
	params[:post][:category] = Category.find_by_category_name(get_category_name(params[:category]))
	params[:post][:key] = Post.generate_key
  @post = Post.create(params[:post])
  session[:post_id] = @post.id
  redirect to("/#{routify(@post.category)}")
end

get "/post/:id/edit/:key" do
  @post = Post.find(params[:id])
  if @post.validate_key(params[:key])
    erb :edit_post
  else
    erb :unathorized
  end
end

post "/post/:id/edit" do
	params[:post][:price] = string_to_price(params[:post][:price])
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect to("/#{routify(@post.category)}")
end

def string_to_price(str)
  (str.to_f*100).to_i
end

def routify(category)
  category.name.gsub(/\s/, "_")
end

def get_category_name(route)
  route.split("_").join(" ")
end