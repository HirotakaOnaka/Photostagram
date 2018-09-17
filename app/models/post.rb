class Post < ApplicationRecord
  validates :image, presence: true
  validates :content, length: { maximum: 255 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
end
