get '/' do
  categories_info
  erb :index
end

get '/categories/:id' do
  @current_category_id = params[:id]
  @posts = Post.where(category_id: @current_category_id)
  erb :categories
end

get '/posts/:id' do
  @current_post_id = params[:id]
  @post = Post.find(@current_post_id)
  erb :posts
end

get '/posts' do
  @categories = Category.all
  erb :new_post
end

post '/post_success' do
  @edit_url = generate_secret_url
  create_new_post(params)
  @post_id = Post.where(secret_url: @edit_url)[0].id.to_s
  erb :post_success
end

post '/successful_update' do
  update_post(params)
  erb :successful_update # display success page for update
end

# this will become the route to the
# "secret" edit url for the post
get '/edit/:edit_url' do
  redirect 'https://github.com/doesntexist' unless is_valid_secret_url?(params[:edit_url])
  @categories = Category.all
  @post = Post.where(secret_url: params[:edit_url])[0]
erb :edit_post
end

post '/delete_post' do
  delete_post(params)
  erb :post_deleted
end

def delete_post(attributes)
  Post.destroy(attributes["post_id"].to_i)
end

def update_post(attributes)
  post = Post.find(attributes["post_id"])
  post.title = attributes["title"]
  post.price = attributes["price"].to_f
  post.description = attributes["description"]
  post.city = attributes["city"]
  post.state = attributes["state"]
  post.email = attributes["email"]
  post.save!
end

def create_new_post(params)
  Post.create!(
    title: params["title"],
    price: params["price"],
    description: params["description"],
    city: params["city"],
    state: params["state"],
    email: params["email"],
    secret_url: @edit_url,
    category_id: Category.where(title: params["category"])[0].id
    )
end

def is_valid_secret_url?(secret_url)
  valid = Post.where(secret_url: secret_url)
  valid.empty? ? false : true
end

def categories_info
  @categories = {}
  Category.all.each { |category| @categories[category.id] = category.title }
  @categories
end

def generate_secret_url
  a = ('a'..'z').to_a.shuffle.slice(0,4)
  b = (1000..9999).to_a.shuffle.slice(0,4)
  a.zip(b).flatten.join
end