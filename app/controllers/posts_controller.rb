class PostsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
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
    else
      render :new
    end
  end

  # GET /posts/:id/edit
  def edit
    render "static_pages/edit"
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to static_pages_index_path, notice: "更新しました"
    else
      render "static_pages/edit"
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to static_pages_index_path, notice: "削除しました"
  end

  private

  # ログイン必須
  def require_login
    unless logged_in?
      redirect_to static_pages_index_path, alert: "ログインしてください"
    end
  end

  # 投稿取得
  def set_post
    @post = Post.find(params[:id])
  end

  # 投稿者本人のみ許可
  def authorize_user
    unless @post.user == current_user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  # Strong Parameters
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
