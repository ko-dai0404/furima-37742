class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :last_name,       presence: true
  validates :first_name,      presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  validates :birthday,        presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  NAME_REGEX = /[ぁ-んァ-ヶ一-龥々ー]/
  validates_format_of :last_name,  with: NAME_REGEX
  validates_format_of :first_name, with: NAME_REGEX

  NAME_KANA_REGEX = /[ァ-ヶ]/
  validates_format_of :last_name_kana,   with: NAME_KANA_REGEX
  validates_format_of :first_name_kana,  with: NAME_KANA_REGEX


end
