require 'digest'

get '/' do
	@categories = Category.pluck(:name)
  erb :index
end

get '/categories/:category_name' do
	@category = Category.find_by_name(params[:category_name])
	@posts = @category.posts
	erb :category
end

get '/posts/new' do   # Needs to be cleaned up a lot
	@categories = get_ordered_category_list(Category.find(params[:id]))
	erb :new_post
end

get '/posts/:post_id' do
	@post = Post.find(params[:post_id])
	erb :post
end

post '/posts' do # Really ugly code. Needs to be cleaned up
	@post = Post.new(params[:post])
	if @post.valid?
		@post.save
		erb :post_auth
	else
		@errors = @post.errors.messages
		erb :error
	end
end

get '/posts/:id/edit' do  # Really ugly code. Needs to be cleaned up
	edit_key = params[:key]
	@post = Post.find_by_edit_key(edit_key)
	if @post.nil?
		redirect '/'
	end
	@categories = get_ordered_category_list(@post.category)
	@title = "Edit post #{params[:id]}"
	erb :edit
end

put '/posts/:id' do
	p params
	@post = Post.find(params[:id])
	@post.update_attributes(params[:post])
	if @post.valid?
		@post.save
		erb :post
	else
		@errors = @post.errors.messages
		erb :error
	end
end

get "/cancel" do
	"Y U NO GIVE ME BITCOIN?"
end
