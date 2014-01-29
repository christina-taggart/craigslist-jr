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
  puts "you are here"
  p params
  erb :posts
end

get '/posts' do
  @categories = Category.all
  erb :new_post
end

post '/post_success' do
  puts "you got to the post part"
  @edit_url = generate_secret_url
  #create_new_post(params)
  erb :post_success
end

# this will become the route to the
# "secret" edit url for the post
get '/edit/:edit_url' do

end


def create_new_post(params)
  Post.create(
    title: params["title"],
    price: params["price"],
    description: params["description"],
    city: params["city"],
    state: params["state"],
    email: params["email"],
    secret_url: @edit_url,
    category_id: Category.where(title: params["category"]).id
    )
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