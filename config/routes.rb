Rails.application.routes.draw do
  # ルート
  root "static_pages#login"

  # StaticPages
  get  "static_pages/login", to: "static_pages#login",      as: :static_pages_login
  post "static_pages/login", to: "static_pages#login_post", as: :login

  get "static_pages/login_new",  to: "static_pages#login_new"
  get "static_pages/login_pass", to: "static_pages#login_pass"

  get  "static_pages/thread_view",  to: "static_pages#thread_view",  as: :static_pages_thread_view
  get  "static_pages/thread_index", to: "static_pages#thread_index", as: :static_pages_index
  get  "static_pages/new_post",     to: "static_pages#new_post"
  post "static_pages/create_post",  to: "static_pages#create_post"

  # Users
  resources :users, only: [:create]
  patch "users/update_password", to: "users#update_password"

  # Posts（★ここが重要）
  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :replies, only: :create
  end

  # ヘルスチェック
  get "up" => "rails/health#show"
end
