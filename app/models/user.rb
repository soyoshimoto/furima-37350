class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true do
    validates :firstname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :lastname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :firstname_ruby, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :lastname_ruby, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
end
