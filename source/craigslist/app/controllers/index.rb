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

post '/post/delete' do
  @post = Post.find(params[:id])
  @post.destroy

  erb :delete

end



get '/posts/:id' do
   @post = Post.find(params[:id])
  erb :posts
end

post '/posts' do
  #create a new post
  @post = Post.create(params)
  redirect "/posts/#{@post.id}/#{@post.secret}"
end

get '/posts/:id/:secret' do
  @post = Post.find(params[:id])
  erb :secret
end


post '/posts/updated/:id/:secret' do
  # old_params = params
  # new_params =
  p @post.id
  @post = Post.find(params[:id])
  @post.update_attributes(:email => params[:email], :name => params[:name], :description => params[:description])

  redirect "/posts/#{@post.id}/#{@post.secret}"
  end