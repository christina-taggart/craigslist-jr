get '/' do
	@categories = Category.pluck(:name)
  erb :index
end


get '/categories/:category_name' do
	@category = Category.where(name: params[:category_name]).pop
	@posts = @category.posts
	erb :category
end

get '/posts/new' do

end

get '/posts/:post_id' do
	@post = Post.where(id: params[:post_id]).pop
	erb :post
end



# post '/category/'