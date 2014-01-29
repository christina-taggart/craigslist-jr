class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.text :description
      t.string :title, :city, :state, :email, :secret_url
      t.float :price
      t.timestamps
    end
  end
end
