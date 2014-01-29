class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |column|
      column.string :content, :title, :email
      column.integer :price, :category_id
      column.timestamps
    end
  end
end
