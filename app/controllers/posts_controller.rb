class PostsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.user == current_user && @post.update(params.permit(:content, :image))
      redirect_to static_pages_thread_view_path(id: @post.id)
    else
      redirect_to static_pages_index_path
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.user == current_user
      @post.destroy
    end

    redirect_to static_pages_index_path
  end

  private

  # ★ テスト仕様に合わせる
  def require_login
    redirect_to static_pages_index_path unless current_user
  end
end
