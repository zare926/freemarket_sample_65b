class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :user
  belongs_to :item

  validates :image,
    presence: true,
    presence: { message: "画像がありません" }
end
