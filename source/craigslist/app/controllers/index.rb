get '/' do
  # Look in app/views/index.erb
  erb :index
end

# get '/posts' do

#   erb :posts
# end
get '/furniture' do
    @allposts = Post.where("category_id = 1")
   erb :furniture
end

get '/clothing' do
  @allposts = Post.where("category_id = 2")
  erb :clothing
end



get '/posts/:id' do
   @post = Post.find(params[:id])
  erb :posts
end

post '/posts' do
  #create a new post
  @post = Post.create(params)
  redirect "/posts/#{@post.id}"
end

