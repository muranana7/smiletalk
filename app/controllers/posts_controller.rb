class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @reply = @post.replies.new
  end



  def post_params
    params.require(:post).permit(:nickname, :body, :image)
  end



  def new
  end

  def create
    @thread = Post.find(params[:thread_id])
    @post = @thread.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to thread_path(@thread)
    else
      render "static_pages/thread_view"
    end
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
