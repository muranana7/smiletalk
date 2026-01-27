class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create_post
    @post = Post.new(
      content: params[:content],
      image: params[:image],
      user: current_user
    )
    @post.save
    redirect_to static_pages_thread_view_path(id: @post.id)
  end


  def destroy
    @post = Post.find(params[:id])

    if @post.user == current_user
      @post.destroy
      redirect_to static_pages_index_path, notice: "投稿を削除しました"
    else
      redirect_to static_pages_index_path, alert: "削除できません"
    end
  end

  def edit
  end

  def update
  end
end
