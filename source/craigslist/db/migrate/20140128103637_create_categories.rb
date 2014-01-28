class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |column|
      column.string :title
  	end
  end
end
