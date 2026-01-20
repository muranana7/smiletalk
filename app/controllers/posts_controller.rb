class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  # 未ログイン時のアクセス制御
  before_action :require_login, only: [ :new, :create ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # require_login で未ログインは弾かれるので、そのままでOK
  end

  def create_post
    @post = Post.new(
      content: params[:content],
      image: params[:image],
      user: current_user
    )

    if @post.save
      redirect_to static_pages_thread_view_path(id: @post.id)
    else
      render :new
    end
  end

  def edit
    render "static_pages/edit"
  end

  def destroy
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to post_path(@post), alert: "権限がありません"
      return
    end

    @post.destroy
    redirect_to static_pages_index_path, notice: "削除しました"
  end

  def update
    if @post.update(post_params)
      redirect_to static_pages_thread_view_path(id: @post.id), notice: "更新しました"
    else
      render "static_pages/edit"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to static_pages_index_path, alert: "権限がありません" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def require_login
    unless logged_in?
      redirect_to static_pages_index_path
    end
  end
end
