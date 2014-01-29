class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string :title
      t.string :content
      t.decimal :price
      t.string :email
      t.timestamps
    end
  end
end
