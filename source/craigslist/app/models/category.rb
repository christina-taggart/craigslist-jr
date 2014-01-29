class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
end