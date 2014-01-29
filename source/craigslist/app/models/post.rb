class Post < ActiveRecord::Base
  validates :description, :title, :city, :state, :email, presence: true
end
