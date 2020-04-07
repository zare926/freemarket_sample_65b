class Item < ApplicationRecord
  validates :name,
    presence: true,
    presence: { message: "入力してください" }

  validates :status,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください" }

  validates :description,
    presence: true,
    presence: { message: "入力してください" }

  validates :category_id,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください" }

  validates :state,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください" }

  validates :postage,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください" }

  validates :prefecture,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください"}

  validates :shipping_date,
    presence: true,
    acceptance: true,
    presence: { message: "選択してください" }

  validates :price,
    presence: true,
    acceptance: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
    presence: { message: "must be less than or equal to 300" }

  has_many :comments
  has_many :images
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
end
