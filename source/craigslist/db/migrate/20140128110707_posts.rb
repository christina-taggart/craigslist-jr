class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title
      t.text     :description
      t.integer  :price
      t.string   :secret_key
      t.float    :lat
      t.float    :lng
      t.integer  :category_id
    end
  end
end
