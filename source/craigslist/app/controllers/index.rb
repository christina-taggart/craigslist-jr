require 'faker'

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
  @edit_key = params[:edit_key]
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
           price: params[:price],
           edit_key: Faker::Lorem.word + rand(100).to_s
          )
  if new_post.save
    redirect "/posts/#{new_post.id}?edit_key=#{new_post.edit_key}"
  else
    redirect "/add/error"
  end
end

get '/edit/:edit_key' do
  @edited_post = Post.where(edit_key: params[:edit_key]).first
  erb :edit
end

post '/edit/:edit_key' do
  @edited_post = Post.where(edit_key: params[:edit_key]).first
  @edited_post.title = params[:title]
  @edited_post.description = params[:description]
  @edited_post.email = params[:email]
  @edited_post.price = params[:price]
  if @edited_post.save
    redirect "/posts/#{@edited_post.id}?edit_key=#{@edited_post.edit_key}"
  else
    redirect "/add/error"
  end
end
