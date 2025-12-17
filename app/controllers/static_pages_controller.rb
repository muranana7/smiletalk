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
  # ログイン済みなら session[:user_id] で取得
  @user = User.find_by(id: session[:user_id]) || User.new
  # 未ログインでも @user が nil にならないよう User.new にする
end


  def thread_view
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to static_pages_index_path, alert: "投稿が見つかりませんでした"
    end
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
      @post = current_user.posts.build(
        title: params[:title],
        content: params[:content],
        image: params[:image]
      )

      if @post.save
        flash[:notice] = "投稿が完了しました！"
        redirect_to static_pages_thread_view_path
      else
        flash[:alert] = "投稿に失敗しました"
        render :new_post
      end
    end


  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
