class Category < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true, uniqueness: true

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
