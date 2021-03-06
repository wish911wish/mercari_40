class User < ApplicationRecord
  has_many :sns_credentials, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  before_save :convert_to_full_width_characters
  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :user_evaluations, foreign_key: :evaluatee_id, dependent: :destroy, inverse_of: :user

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

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        email:    auth.info.email,
        image:    auth.info.image,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

end
