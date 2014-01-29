require 'faker'

class Post < ActiveRecord::Base
  belongs_to :category
  validates :secret_key, uniqueness: true
  validates :title, presence: true

  def self.get(params)
    Post.where(title: params[:post]).first
  end

  def self.secret_get(params)
    Post.where(secret_key: params[:secret_key]).first
  end

  def self.post_update(params)
    post = Post.find(params[:post_id].to_i)
    post.title = params[:title]
    post.description = params[:description]
    post.price = params[:price].to_i
    post.category = Category.where(name: params[:category]).first
    post.save
    post
  end

  def self.new_post(params)
    created_post = Post.create(fill_attrs(params))
    Category.get(params).posts << created_post
    created_post
  end

  def self.fill_attrs(params)
    title = params[:title]
    description = params[:description]
    price = params[:price].to_i
    secret_key = Faker::Lorem.characters(char_count = 9)
    {title: title, description: description, price: price, secret_key: secret_key}
  end

  def edit(post_id, updates)
    self.update(post_id, updates)
  end

end
