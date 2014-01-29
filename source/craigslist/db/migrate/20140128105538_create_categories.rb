class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |column|
      column.string :name
      column.timestamps
    end
  end
end
