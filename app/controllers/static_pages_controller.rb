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
end
