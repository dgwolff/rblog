class User < ActiveRecord::Base
  has_many :posts

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  validates_confirmation_of :password
end
