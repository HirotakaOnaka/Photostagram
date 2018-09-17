class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 30 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :self_introduction, length: { maximum: 225 }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader
end
