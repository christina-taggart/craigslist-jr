class AddEditKey < ActiveRecord::Migration
  def change
    add_column :posts, :edit_key, :string
  end
end
