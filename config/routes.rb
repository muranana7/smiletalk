Rails.application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "posts/edit"
  get "posts/update"

  # ルート（トップページ）
  root "static_pages#login"

  # threads と posts（掲示板構造）
  resources :threads do
    resources :replies, only: [:create]
  end

  resources :posts, only: [:show]

  resources :posts do
    resources :replies, only: [:create]
  end
  
  # Users
  resources :users, only: [:create]
  patch "users/update_password", to: "users#update_password", as: :update_password

  # StaticPagesController のルート
  get  "static_pages/login", to: "static_pages#login",      as: :static_pages_login
  post "static_pages/login", to: "static_pages#login_post", as: :login

  get "static_pages/login_new",  to: "static_pages#login_new",  as: :static_pages_login_new
  get "static_pages/login_pass", to: "static_pages#login_pass", as: :static_pages_login_pass

  get "static_pages/thread_view", to: "static_pages#thread_view", as: :static_pages_thread_view
  get "static_pages/post_edit", to: "static_pages#post_edit", as: :static_pages_post_edit
  post "static_pages/delete", to: "static_pages#delete_post", as: :static_pages_delete_post
  get "static_pages/delete_complete", to: "static_pages#delete_complete", as: :static_pages_delete_complete
  post "static_pages/update", to: "static_pages#update_post", as: :static_pages_update_post
  get "static_pages/update_complete", to: "static_pages#update_complete", as: :static_pages_update_complete
  get "static_pages/thread_index", to: "static_pages#thread_index", as: :static_pages_index
  get "static_pages/new_post", to: "static_pages#new_post", as: :static_pages_new_post
  post "static_pages/create_post", to: "static_pages#create_post", as: :static_pages_create_post

  # UsersController のルート
  resources :users, only: [ :create ]  # 新規作成のみ

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
