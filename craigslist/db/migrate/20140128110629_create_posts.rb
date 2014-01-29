class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
			t.string  :title
			t.text  :body
			t.string  :image_url
			t.integer :price
			t.string  :email
			t.integer :category_id

			t.string :edit_key
			t.timestamps
  	end
  end
end
