
class PostImporter
  def self.import
    Post.create({email: 'emailstuff@gmail.com', name: 'Da Couch', description: 'This is a good couch with 2 holes', category_id: 1 })
    Post.create({email: 'joesmith@mac.com', name: 'Power Suits', description: 'Selling power suits', category_id: 2})
    Post.create({email: 'darcey@hgotmail.com', name: 'D-$', description: 'sweet ass kicks', category_id: 2})
  end
end

class CategoryImporter
  def self.import
    Category.create({name: 'Furniture'})
    Category.create({name: 'Clothing'})
  end
end
