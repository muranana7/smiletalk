class Post < ApplicationRecord
  # Active Storage: 複数の画像を添付できるように設定
  has_many_attached :images

  # 本文 (content) は必須とする
  validates :content, presence: true
end
