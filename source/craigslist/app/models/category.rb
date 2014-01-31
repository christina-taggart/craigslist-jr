class Category < ActiveRecord::Base
  has_many :posts

  def capitalize
    name.split(' ').map { |w| w.capitalize}.to_a.join(" ")
  end

  def self.find_by_category_name(params_name)
    where(name: get_category_name(params_name)).first
  end

  def routify
    self.name.gsub(/\s/, "_")
  end

  def self.get_category_name(route)
    route.split("_").join(" ")
  end
end