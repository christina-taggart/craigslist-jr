get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id' do
  @posts = Post.joins(:category).where(categories: {id: params[:id]})
  erb :categories
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :posts
end
