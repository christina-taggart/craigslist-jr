class Post < ActiveRecord::Base
  belongs_to :category

  validates_associated :category

  validates :email, presence: true
  validates :title, presence: true
  validates :title, length: { in: 5..100 }
  validates :body, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
