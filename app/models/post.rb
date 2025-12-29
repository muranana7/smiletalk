class Post < ApplicationRecord
  # Active Storage: 複数の画像を添付できるように設定
  belongs_to :user
  has_one_attached :image

  # 本文 (content) は必須とする
  validates :title, presence: true
  validates :content, presence: true

  has_many :replies, dependent: :destroy
  belongs_to :user, optional: true
end
