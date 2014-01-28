require 'active_record'

class Category < ActiveRecord::Base
  has_many :posts

  def self.list
    Category.all.map {|cat| cat.name}
  end
end


