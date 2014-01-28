class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |column|
  	  belongs_to :category
      t.string :title
      t.string :post_content
      t.string :price
      t.string :location
      t.timestamps
  	end
  end
end