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

get '/add' do
  erb :add
end

post '/add' do
  new_post = Post.new(category_id: params[:category_id],
           title: params[:title],
           description: params[:description],
           email: params[:email],
           price: params[:price]
          )
  new_post.save
  redirect "/posts/#{new_post.id}"
end
