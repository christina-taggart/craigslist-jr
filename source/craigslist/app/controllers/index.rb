require_relative '../../config/environment'
require_relative '../../config/database'


get '/' do
  @categories = Category.all
  erb :index
end

post '/posted' do
  title = params[:title]
  content = params[:content]
  email = params[:email]
  category_id = Category.where(name: params[:category])[0].id
  @secret = rand(100000..999999)
  Post.create(title: title, content: content, email: email, category_id: category_id, secret: @secret)
  @category = Category.where(id: category_id)[0]
  @post_id = Post.all.length
  @url = "localhost:9393/#{@category.name}/#{@post_id}/#{@secret}"
  erb :posted
end

get '/new' do
  @categories = Category.list
  erb :new
end

get '/:category' do
  @category = Category.where(name: params[:category])[0]
  @posts = @category.posts
  @cat_name = params[:category]
  erb :posts
end

get '/:category/:post' do
  @post = Post.where(id: params[:post].to_i)[0]
  erb :indv_post
end

get '/:category/:post/:secret' do
  @post = Post.where(id: params[:post].to_i)[0]
  if @post.secret.to_i == params[:secret].to_i
    erb :post_edit
  else
    erb :invalid
  end
end

post '/:category/:post' do
  @post = Post.where(id: params[:post].to_i)[0]
  @post.update_attributes(title: params[:title], content: params[:content])
  erb :indv_post
end

