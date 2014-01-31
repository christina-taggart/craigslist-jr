enable :sessions

get '/' do
  @categories = Category.all
  erb :categories
end

get "/:category" do
  puts "just_created: #{@just_created}"
  @category = Category.find_by_category_name(params[:category])
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
  puts "cat is #{params[:category]}"
  post = params[:post]
  post[:category] = Category.find_by_category_name(params[:category])
  @post = Post.create_from_params(post)
  session[:post_id] = @post.id
  redirect to("/#{@post.category.routify}")
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
  redirect to("/#{@post.category.routify}")
end
