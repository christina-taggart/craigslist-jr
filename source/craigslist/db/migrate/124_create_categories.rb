class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |col|
      col.string :name
    end
  end
end