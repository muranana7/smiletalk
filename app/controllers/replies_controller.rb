class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    
    if @reply.save
      redirect_to static_pages_thread_view_path(id: @post.id), notice: "返信を投稿しました"
    else
      redirect_to static_pages_thread_view_path(id: @post.id), alert: "返信に失敗しました"
    end
  end
  
  private

  def reply_params
    params.require(:reply).permit(:nickname, :body, :image)
  end

end
