class Post < ActiveRecord::Base
  belongs_to :category


  # def self.posts(post_info = {})
  #   description = post_info[:description]
  #   price = post_info[:price]
  #   email = post_info[:email]
  # end
end