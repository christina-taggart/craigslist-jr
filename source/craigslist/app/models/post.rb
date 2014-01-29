class Post < ActiveRecord::Base
  belongs_to :categories
  validates :title, uniqueness: { scope: :category_id}
  validates :email, format: {with: /\A.+@.{2,}\..+\z/}
  validates :price, numericality: {only_integer: true}
  validates :edit_url, uniqueness: true

  def self.secret_url
    (('a'..'z').to_a + (0..9).to_a).shuffle.sample(5).join
  end

  def update_values(args = {})
    self.title = args[:title]
    self.body = args[:body]
    self.price = args[:price]
    self.save
  end
end

# Posts table:
# category_id
# title
# body
# contact email (not displayed)
# price
# edit url