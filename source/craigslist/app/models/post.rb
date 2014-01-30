class Post < ActiveRecord::Base
  belongs_to :category

  def price_formatted
    sprintf("%#.2f",(price / 100.0))
  end

  def self.generate_key
    [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  end

  def set_key_to(string)
    self.key = string
    save
  end

  def validate_key(key_guess)
    self.key == key_guess ? true : false
  end
end