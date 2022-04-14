class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: {with: /[a-z]\d/}
  validates :last_name, presence: true, format: {with: /[ぁ-んァ-ヶ一-龥々ー]/}
  validates :first_name, presence: true, format: {with: /[ぁ-んァ-ヶ一-龥々ー]/}
  validates :last_name_kana, presence: true, format: {with: /[ァ-ヶ]/}
  validates :first_name_kana, presence: true, format: {with: /[ァ-ヶ]/}
  validates :birth_day, presence: true

end
