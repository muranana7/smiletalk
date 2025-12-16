class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
