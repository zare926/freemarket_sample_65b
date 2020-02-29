class Category < ApplicationRecord
  validates :category, acceptance: true
  has_many :items
end
