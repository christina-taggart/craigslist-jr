class Post < ActiveRecord::Base
  belongs_to :category

  def price_formatted
    sprintf("%#.2f",(price / 100.0))
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

  def self.create_from_params(post)
    post[:price] = string_to_price(post[:price])
    post[:key] = Post.generate_key
    create(post)
  end

  def self.string_to_price(str)
    (str.to_f*100).to_i
  end
end