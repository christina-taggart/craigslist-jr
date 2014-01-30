class Category < ActiveRecord::Base
  has_many :posts

  def capitalize
    name.split(' ').map { |w| w.capitalize}.to_a.join(" ")
  end

  def self.find_by_category_name(name)
    where(name: name).first
  end
end