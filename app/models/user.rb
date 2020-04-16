class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true

  has_many :items
  has_many :comments
  has_many :buy_items
  has_many :images
  has_many :credit_cards
end
