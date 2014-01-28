class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string :description
      t.integer :price
      t.string :email
      t.timestamp
    end
  end
end
