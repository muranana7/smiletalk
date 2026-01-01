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
    @post = Post.new(post_params)
    
    if current_user
      @post.user = current_user
    end
    
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
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
  @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to post_path(@post)
  else
    render :edit
  end
end
end
