require_relative '../../config/database'
require_relative '../../config/environment'

class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :description, presence: true
  validates :email, presence: true
end
