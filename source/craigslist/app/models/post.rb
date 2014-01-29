class Post < ActiveRecord::Base
  belongs_to :category

  validate_associated :category
end