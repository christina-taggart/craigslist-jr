require_relative '../../config/database'
require_relative '../../config/environment'

class Category < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
end
