Rails.application.routes.draw do
  # ルート
  root "static_pages#login"

  # StaticPagesController
  get  "static_pages/login", to: "static_pages#login", as: :static_pages_login
  post "static_pages/login", to: "static_pages#login_post", as: :login

  get "static_pages/login_new",  to: "static_pages#login_new"
  get "static_pages/login_pass", to: "static_pages#login_pass"

  get  "static_pages/thread_view",    to: "static_pages#thread_view"
  get  "static_pages/thread_index",   to: "static_pages#thread_index", as: :static_pages_index
  get  "static_pages/new_post",        to: "static_pages#new_post"
  post "static_pages/create_post",     to: "static_pages#create_post"

  get  "static_pages/post_edit",       to: "static_pages#post_edit"
  post "static_pages/update",          to: "static_pages#update_post"
  get  "static_pages/update_complete", to: "static_pages#update_complete"

  post "static_pages/delete",          to: "static_pages#delete_post"
  get  "static_pages/delete_complete", to: "static_pages#delete_complete"

  # Users
  resources :users, only: [:create]
  patch "users/update_password", to: "users#update_password"

  # ✅ Posts（ここが最重要）
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
