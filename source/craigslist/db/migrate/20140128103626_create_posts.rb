class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |column|
  	  column.belongs_to :category
      column.string :title
      column.string :post_content
      column.string :price
      column.string :location
      column.timestamps
  	end
  end
end