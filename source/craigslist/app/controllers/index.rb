get '/' do
  @categories = Category.pluck(:name)
  erb :index
end

get '/display-posts/:category_name' do
  category = Category.where(name: params[:category_name]).first
  @category_posts = category.posts
  erb :display_posts
end

get '/create-categories' do
  erb :create_categories
end

get '/create-posts' do
  erb :create_posts
end

post '/posts' do
  p params
  Post.create(params)
  redirect '/'
end

post '/categories' do
  Category.create(params)
  redirect '/'
end

get '/display-item/:item' do
  redirect '/'
end