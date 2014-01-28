class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |column|
      has_many :posts
      t.string :title
  	end
  end
end
