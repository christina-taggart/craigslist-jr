require_relative '../../config/environment'

class Post < ActiveRecord::Base
  validates :secret, uniqueness: true
  belongs_to :category
end