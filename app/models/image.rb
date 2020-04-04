class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :user
  belongs_to :item
end
