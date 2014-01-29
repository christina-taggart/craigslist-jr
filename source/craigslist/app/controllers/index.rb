get '/' do
  @categories = Category.all
  erb :categories
end

get "/:category" do
  @category = Category.get_category_from_route(params[:category])
  @posts = @category.posts.sort_by{ |post| post.updated_at }.reverse
  erb :posts
end

get "/:category/post/new" do
  @category = Category.get_category_from_route(params[:category])
  erb :create_post
end

post "/:category/post/new" do
  @post = Post.create_from(params)
  redirect to("/#{@post.category.routify}")
end

get "/post/:id/edit" do
  @post = Post.find(params[:id])
  erb :edit_post
end

post "/post/:id/edit" do
  @post = Post.find(params[:id])
  @post.update_details(params)
  redirect to("/#{@post.category.routify}")
end
