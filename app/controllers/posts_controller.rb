class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to static_pages_thread_view_path(id: @post.id), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    render "static_pages/edit"
  end

  def update
    if @post.update(post_params)
      redirect_to static_pages_thread_view_path(id: @post.id), notice: "更新しました"
    else
      render "static_pages/edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # 自分の投稿だけ削除できるようにする
    unless @post.user_id == current_user.id
      redirect_to post_path(@post), alert: "権限がありません"
      return
    end

    @post.destroy
    redirect_to static_pages_index_path, notice: "削除しました"
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
end
