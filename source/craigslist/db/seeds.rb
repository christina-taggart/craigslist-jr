require 'yaml'

class CraigslistImporter
  def self.import(filename)
    yml =  YAML.load_file(filename)
    yml.each do |y|
      new_list = Category.create(name: y.shift)
      id = new_list.id
      y.each do |post_by_category|

        post_by_category.each do |post|
          url = (('a'..'z').to_a + (0..9).to_a).shuffle.sample(5).join
          Post.create(title: post['title'],
          body: post['body'], price: post['price'].to_i, email: post['email'],
          category_id: new_list.id, edit_url: url)
        end
      end
    end
  end
end