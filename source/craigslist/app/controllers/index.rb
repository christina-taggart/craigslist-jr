get '/' do
  @categories = Category.all

  erb :index
end

post '/category/new' do
  Category.new_category(params)

  redirect to('/')
end

post '/post/new' do
  post = Post.new_post(params)

  redirect to("/post/edit?secret_key=#{post.secret_key}")
end

get '/post/edit' do
  if params[:secret_key]
    @post = Post.secret_get(params)
    erb :post_edit
  else
    erb :post_secret
  end
end

post '/post/update' do
  updated_post = Post.post_update(params)

  redirect to("/post/edit?secret_key=#{updated_post.secret_key}")
end

get '/posts/:post' do
  @post = Post.get(params)

  erb :post
end

get '/categories/:category' do
  @category = Category.get(params)

  erb :category
end

get '/map' do
  @posts = Post.all

  erb :map
end




