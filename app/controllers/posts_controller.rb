
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_post,      only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  # GET /posts
  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/:id
  def show
    # @post は set_post で取得済み
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿しました"
      # 例: redirect_to static_pages_thread_view_path(id: @post.id), notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/:id/edit
  def edit
    # 例: render "static_pages/edit"
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
      # 例: redirect_to static_pages_thread_view_path(id: @post.id), notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "削除しました"
    # 例: redirect_to static_pages_index_path, notice: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # 投稿者以外は編集・削除不可
  def authorize_user!
    redirect_to posts_path, alert: "権限がありません" unless @post.user_id == current_user&.id
  end

  # 未ログイン時のアクセス制御
  def require_login
    unless current_user
      redirect_to login_path, alert: "ログインしてください"
      # ↑ アプリで使っているログインページのパスに置き換えてください
      # 例: redirect_to static_pages_index_path, alert: "ログインしてください"
    end
  end

  # Strong Parameters
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
