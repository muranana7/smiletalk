class UsersController < ApplicationController
  # 新規ユーザー作成
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.map do |msg|
        case msg
        when "Email has already been taken"
          "そのメールアドレスはすでに登録されています"
        when "Nickname has already been taken"
          "そのニックネームはすでに登録されています"
        when "Email can't be blank"
          "メールアドレスを入力してください"
        when "Email is invalid"
          "メールアドレスの形式が正しくありません"
        when "Nickname can't be blank"
          "ニックネームを入力してください"
        when "Password can't be blank"
          "パスワードを入力してください"
        when "Password is too short (minimum is 6 characters)"
          "パスワードは6文字以上で入力してください"
        else
          msg
        end
      end.join(", ")
      redirect_to static_pages_login_new_path
    end
  end

  # パスワード更新（再登録用）
  def update_password
  user_params = params[:user] || {}
  @user = User.find_by(id: session[:user_id]) || User.find_by(email: params.dig(:user, :email))
  if @user.nil?
  # ユーザーが存在しない場合のメッセージ
  flash[:alert] = "ユーザーが見つからないので、再登録画面から新規登録画面に移動しました。新規登録を行ってください。"
  redirect_to static_pages_login_new_path and return
end


  @user.password = user_params[:password]

  if @user.save
    flash[:notice] = "パスワードを更新しました"
    redirect_to root_path
  else
    flash.now[:alert] = @user.errors.full_messages.map do |msg|
      case msg
      when "Password can't be blank"
        "パスワードを入力してください"
      when "Password is too short (minimum is 6 characters)"
        "パスワードは6文字以上で入力してください"
      else
        msg
      end
    end.join(", ")
    render "static_pages/login_pass"
  end
end






  private

  # strong parameters（新規登録用）
  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
