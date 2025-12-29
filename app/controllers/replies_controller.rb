# app/controllers/replies_controller.rb
class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)

    if @reply.save
      redirect_to static_pages_thread_view_path(@post)
    else
      @replies = @post.replies.order(created_at: :asc)
      render "static_pages/thread_view"
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:nickname, :body)
  end
end
