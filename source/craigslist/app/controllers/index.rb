get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id' do
  @category_name = Category.find(params[:id]).name
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

get '/add/error' do
  @error = true
  erb :add
end

post '/add' do
  new_post = Post.new(category_id: params[:category_id],
           title: params[:title],
           description: params[:description],
           email: params[:email],
           price: params[:price]
          )
  if new_post.save
    redirect "/posts/#{new_post.id}"
  else
    redirect "/add/error"
  end
end
