class StaticPagesController < ApplicationController
  def login
  end

  def login_new
  end

  def login_pass
  end

  def thread_view
  end

  def post_edit
  end

  def delete_post
    redirect_to static_pages_delete_complete_path
  end

  def delete_complete
  end

  def update_post
    redirect_to static_pages_update_complete_path
  end

  def update_complete
  end

   def new_post
    # 投稿フォーム表示
  end

  def create_post
    content = params[:content]

    if content.blank?
      flash[:alert] = "本文を入力してください"
      redirect_to static_pages_new_post_path
      return
    end

    File.open(Rails.root.join("tmp", "posts.txt"), "a") do |f|
      f.puts("#{Time.now}: #{content}")
    end

    render inline: "<script>alert('投稿が完了しました！'); window.location.href='/static_pages/thread_index';</script>"
  end
end
