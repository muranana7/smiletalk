Rails.application.routes.draw do
  # ルート（トップページ）
  root "static_pages#login"

  # 各ページへのルート（名前付きヘルパー付き）
  get "static_pages/login_new",  to: "static_pages#login_new",  as: :login_new
  get "static_pages/login_pass", to: "static_pages#login_pass", as: :login_pass

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
