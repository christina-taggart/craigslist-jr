class Post < ActiveRecord::Base
  belongs_to :category

  validates_associated :category

  validates :email, presence: true
  validates :title, presence: true
  validates :title, length: { in: 5..100 }
  validates :body, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  before_create :encrypt_url


  def encrypt_url
		self.edit_key = Digest::SHA256.hexdigest(Time.now.to_s + self.title + rand(1..99).to_s + ('a'..'z').to_a.sample)
	end
end
