

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

post '/posts' do
  p params
  Post.create(params)

  redirect '/'
end
