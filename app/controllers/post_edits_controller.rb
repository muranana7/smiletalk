class PostEditsController < ApplicationController
  before_action :require_login
  before_action :set_post
  before_action :authorize_user

  def edit
    render "static_pages/edit"
  end

  def update
    if @post.update(post_params)
      redirect_to static_pages_index_path, notice: "投稿を更新しました"
    else
      render "static_pages/edit"
    end
  end

  private

  def require_login
    return if logged_in?
    redirect_to login_path, alert: "ログインしてください"
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    return if @post.user == current_user
    redirect_to posts_path, alert: "権限がありません"
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
