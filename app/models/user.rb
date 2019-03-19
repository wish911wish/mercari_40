class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :convert_to_full_width_characters

  with_options presence: true do
    validates :email
    validates :password
    validates :password_confirmation
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end

  validates :first_name, format: {
    with: /\A[ぁ-んァ-ン一-龥ー]+\z/,
    message: "に数字や特殊文字は使用できません"
  }

  validates :family_name, format: {
    with: /\A[ぁ-んァ-ン一-龥ー]+\z/,
    message: "に数字や特殊文字は使用できません"
  }

  validates :first_name_kana, format: {
    with: /\A[ァ-ンー]+\z/,
    message: "はカナ文字を入力してください"
  }

  validates :family_name_kana, format: {
    with: /\A[ァ-ンー]+\z/,
    message: "はカナ文字を入力してください"
  }

  def convert_to_full_width_characters
    self.family_name = NKF.nkf('-w', self.family_name)
    self.first_name = NKF.nkf('-w', self.first_name)
    self.family_name_kana = NKF.nkf('-w', self.family_name_kana)
    self.first_name_kana = NKF.nkf('-w', self.first_name_kana)
  end
end
