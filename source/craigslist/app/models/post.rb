# A post should have the following info

# title
# post_content
# price
# location
# a specified category

class Post < ActiveRecord::Base
  # def update(params)
  #   self.title = params[:title]
  #   self.post_content = params[:post_content]
  #   self.price = params[:price]
  #   self.location = params[:location]
  #   self.category_id = params[:category_id]
  #   save
  # end
end