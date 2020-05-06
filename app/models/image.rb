class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader

  validates :image,
    presence: true,
    length: {manimum: 1, maximum: 10}
end
