class StaticPagesController < ApplicationController
  def login
  end

  def login_post
    user = User.find_by(nickname: params[:nickname])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to static_pages_index_path
    else
      flash[:alert] = "ニックネームかパスワードが正しくありません"
      # redirect_to static_pages_login_path
      redirect_to root_path

    end
  end

  def login_new
    @user = User.new
  end

  def login_pass
  # ログイン中ユーザーを取得
  @user = User.find(session[:user_id])
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
  end

  def create_post
    title = params[:title]
    content = params[:content]

    if title.blank? || content.blank?
      flash[:alert] = "タイトルと本文を入力してください"
      redirect_to static_pages_new_post_path
      return
    end

    File.open(Rails.root.join("tmp", "posts.txt"), "a") do |f|
      f.puts("#{Time.now}: #{title} - #{content}")
    end

    render inline: "<script>alert('投稿が完了しました！'); window.location.href='/static_pages/thread_index';</script>"
  end
end
