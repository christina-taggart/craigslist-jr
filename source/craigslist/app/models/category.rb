class Category < ActiveRecord::Base
  has_many :posts
  validates :name, uniqueness: true
  validates :name, presence: true

  def self.get(params)
    Category.where(name: params[:category]).first
  end

  def self.new_category(params)
    Category.create(name: params[:name])
  end

  def edit(category_id, updates)
    self.update(category_id, updates)
  end

end
