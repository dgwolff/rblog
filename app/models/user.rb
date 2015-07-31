class User < ActiveRecord::Base
  has_many :posts

  has_secure_password

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  validates_confirmation_of :password

  def self.search(query)
    where("name like ? OR email like ?", "%#{query}%", "%#{query}%")
  end
end
