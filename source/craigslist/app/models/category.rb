class Category < ActiveRecord::Base
  has_many :posts

  def capitalize
    name.split(' ').map { |w| w.capitalize}.to_a.join(" ")
  end

  def routify
    name.gsub(/\s/, "_")
  end

  def self.get_db_name(route)
    route.split("_").join(" ")
  end

  def self.get_category_from_route(route)
    db_name = get_db_name(route)
    where(name: db_name).first
  end
end