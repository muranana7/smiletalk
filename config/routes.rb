Rails.application.routes.draw do
  # ルート
  root "static_pages#login"

  # StaticPages
  get  "static_pages/login",        to: "static_pages#login",        as: :static_pages_login
  post "static_pages/login",        to: "static_pages#login_post",   as: :login
  get  "static_pages/login_new",    to: "static_pages#login_new"
  get  "static_pages/login_pass",   to: "static_pages#login_pass"

  get  "static_pages/thread_index", to: "static_pages#thread_index", as: :static_pages_index
  get  "static_pages/thread_view",  to: "static_pages#thread_view"

  # Users
  resources :users, only: [:create]
  patch "users/update_password", to: "users#update_password", as: :update_password

  # Posts + Replies（重要）
  resources :posts do
    resources :replies, only: [:create]
  end

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end

