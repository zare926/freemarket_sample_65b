class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :postcode, :address_city, :address_block, presence: true

  has_many :items
  has_many :comments
  has_many :buy_items
  has_many :images
  has_many :credit_cards
end
