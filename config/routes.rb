Rails.application.routes.draw do
  # ルート（トップページ）
  root "static_pages#login"

  # 各ページへのルート（名前付きヘルパー付き）
  get "static_pages/login",      to: "static_pages#login",      as: :static_pages_login
  get "static_pages/login_new",  to: "static_pages#login_new",  as: :static_pages_login_new
  get "static_pages/login_pass", to: "static_pages#login_pass", as: :static_pages_login_pass
 
  get "static_pages/thread_index", to: "static_pages#thread_index", as: :static_pages_thread_index

  get "static_pages/thread_view", to: "static_pages#thread_view", as: :static_pages_thread_view

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
