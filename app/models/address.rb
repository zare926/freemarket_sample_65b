class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :address , presence: true
end
