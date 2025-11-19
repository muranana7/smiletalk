class StaticPagesController < ApplicationController
  def login
  end

  def login_new
  end

  def login_pass
  end

  def post_edit   
  end

  def delete_post
    # 実際の削除処理（省略可）
    # Post.find(params[:post_id]).destroy

    # 削除完了ページにリダイレクト
    redirect_to static_pages_delete_complete_path
  end

  def delete_complete
  end

  def update_post
  # 実際はモデル更新
  # Post.find(params[:post_id]).update(content: params[:content])
  redirect_to static_pages_update_complete_path
  end

  def update_complete
  end 
end
