class Picture < ApplicationRecord
  mount_uploader :image_pict, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :content, presence: true, length: { maximum: 140 }
end
