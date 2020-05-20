class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true, uniqueness: true
  validates :email,           presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,        presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,40}+\z/i }
  validates :first_name,      presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :family_name,       presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name_pseudonym, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :family_name_pseudonym,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_year,   presence: true
  validates :birth_month,  presence: true
  validates :birth_day,    presence: true

  validates :address_first_name, null: false, format: { with: /\A[一-龥ぁ-ん]/}
  validates :address_family_name, null: false, format: { with: /\A[一-龥ぁ-ん]/}
  validates :address_first_pseudonym, null: false, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :address_family_pseudonym, null: false, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address_name, presence: true



  has_many :credit_cards
  # -------------
  has_many :items
end
