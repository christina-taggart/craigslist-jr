class GeneratePosts < ActiveRecord::Migration
  def change
    create_table :posts do |col|
      col.belongs_to :category
      col.string :title
      col.string :description
      col.integer :price
      col.string :email
    end
  end
end
