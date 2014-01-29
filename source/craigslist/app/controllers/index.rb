get '/' do
	@categories = Category.pluck(:name)
  erb :index
end


get '/categories/:category_name' do
	@category = Category.where(name: params[:category_name]).pop
	@posts = @category.posts
	erb :category
end

get '/posts/new' do   # Needs to be cleaned up a lot
	category_name = params[:category]
	@categories = Category.all
	category_index = @categories.index{ |cat| cat.name == category_name }
	@categories.insert(0, @categories.delete_at(category_index))
	erb :new_post
end

get '/posts/:post_id' do
	@post = Post.where(id: params[:post_id]).pop
	erb :post
end

post '/posts' do
	new_params = clean_params(params)
	@post = Post.new(new_params)
	if @post.valid?
		@post.save
		erb :post
	else
		@errors = @post.errors.messages
		erb :error_page
	end
end

def clean_params(params)
	params.symbolize_keys!
	price = (params[:price].to_f * 100).to_i
	params[:price] = price

	id = params[:category_id].to_i
	params[:category_id] = id

	params
end
