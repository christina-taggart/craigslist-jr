get '/' do
  @categories = Category.all
  erb :index
end

get '/:category_id/new' do
  @category = Category.find(params[:category_id])
  erb :new_post
end

get '/:category_id/:post_id' do
  @category = Category.find(params[:category_id])
  @post = Post.find(params[:post_id])
  erb :post
end

get '/:category_id/:post_id/:edit_url' do
  @post = Post.find(params[:post_id])
  erb :post_url
end

get '/:category_id' do
  @category = Category.find(params[:category_id])
  @posts = Post.where(category_id: params[:category_id])
  erb :category
end

post '/:category_id/new' do
  @post = Post.create(
    title: params[:title],
    body: params[:body],
    email: params[:email],
    price: params[:price],
    category_id: params[:category_id],
    edit_url: Post.secret_url
    )
  erb :post_confirm
  # redirect "/#{@post.category_id}"
end

put '/:category_id/:post_id' do
  post = Post.find(params[:post_id])
  post.update_values(title: params[:title], body: params[:body], price: params[:price])
  redirect "/#{post.category_id}/#{post.id}"
end

delete '/:post_id' do
  post = Post.find(params[:post_id])
  cat_id = post.category_id
  post.destroy
  redirect "/#{cat_id}"
end
