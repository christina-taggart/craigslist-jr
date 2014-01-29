class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |col|
      col.string :email
      col.string :name
      col.string :description
      col.integer :category_id
    end
  end
end