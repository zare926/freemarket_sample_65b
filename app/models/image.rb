class Image < ApplicationRecord
  belongs_to :user
  belongs_to :item
  mount_uploader :image, ImageUploader

  # validates :image,
  #   presence: true,
  #   presence: { message: "画像がありません" }
end
