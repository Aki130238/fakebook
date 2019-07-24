class Picture < ApplicationRecord
  mount_uploader :image_pict, ImageUploader
end
