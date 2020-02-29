class Category < ApplicationRecord
  validates :category, acceptance: true
  has_many :items
  has_ancestry
end
