class Post < ActiveRecord::Base
  belongs_to :category

  def price_formatted
    sprintf("%#.2f",(price / 100.0))
  end

  def string_to_price(str)
    (str.to_f*100).to_i
  end

  def update_details(params)
    self.title = params[:title]
    self.content = params[:content]
    self.price = string_to_price(params[:price])
    self.email = params[:email]
    save
  end

  def self.create_from(params)
    new_post = self.new
    new_post.title = params[:title]
    new_post.content = params[:content]
    new_post.price = new_post.string_to_price(params[:price])
    new_post.email = params[:email]
    new_post.category = Category.get_category_from_route(params[:category])
    new_post.key = Post.generate_key
    new_post.save
    new_post
  end

  def self.generate_key
    [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  end

  def set_key_to(string)
    self.key = string
    save
  end

  def validate_key(key_guess)
    self.key == key_guess ? true : false
  end
end