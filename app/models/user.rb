class User < ApplicationRecord
  mount_uploader :image_user, ImageUploader
  has_secure_password
  has_many :pictures
  has_many :favorites, dependent: :destroy
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, on: :new
end
