require_relative '../../config/environment'
require_relative '../../config/database'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/newpost' do
  erb :newpost
end

get '/category=:category/:post_id/:secret' do
  @post = Post.where(id: params[:post_id].to_i)[0]
  if @post.secret.to_i == params[:secret].to_i
    erb :master_edit
  else
    erb :wrong
  end
end

get '/:category/:post_id' do
# get '/:category/:post' do
  @category = Category.where(name: params[:name])[0]
  @posts = Post.where(id: params[:post_id])[0]
  erb :viewpost
end

post '/confirmation' do
  Post.create(title: params[:title], content: params[:content], price: params[:price].to_f, email: params[:email], category_id: params[:category_id])
  @category_id = params[:category_id]
  @category = Category.where(id: params[:category_id])[0]
  @secret_part = rand(100000)
  @post_id = Post.all.length
  @url = "localhost:9393/#{@category.name}/#{@posts_id}/#{@secret_part}"
  erb :confirmation
end

get '/*' do
  @category_name = params[:splat][0].capitalize
  @category = Category.where(name: @category_name).first
  @posts = find_posts
  erb @category_name.to_sym
end

#  Post.create(title: params[:title], content: params[:content], price: params[:price].to_f, email: params[:email], category_id: params[:category_id])

def find_posts
  get_category_id
  Post.where category_id: @category_id
end

def get_category_id
  @category_id = Category.where(name: @category_name).first.id
end
