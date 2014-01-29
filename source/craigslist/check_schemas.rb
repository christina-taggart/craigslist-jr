require_relative 'config/environment'

Post.where("category_id = 2").each {|x| p x.description}