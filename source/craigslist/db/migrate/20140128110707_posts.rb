class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title
      t.string   :description
      t.integer  :price
      t.string   :secret_key
      t.integer  :category_id
    end
  end
end
