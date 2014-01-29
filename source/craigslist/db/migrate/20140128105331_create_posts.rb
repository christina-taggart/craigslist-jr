class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, :title, :email, :edit_url
      t.integer :category_id, :price
      t.timestamps
    end
  end
end
