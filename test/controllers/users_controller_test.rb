require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # session[:user_id] を作るためにログインする
    post static_pages_login_path, params: { email: @user.email, password: "password" }
  end

  test "should create user" do
    post users_path, params: {
      user: {
        nickname: "テスト",
        email: "test@example.com",
        password: "password"
      }
    }
    assert_redirected_to root_path
    assert_equal "新規登録が完了しました", flash[:notice]
  end

  test "should update password" do
    patch update_password_path, params: {
      password: "newpassword",
      password_confirmation: "newpassword"
    }
    assert_redirected_to root_path
    assert_equal "パスワードを更新しました", flash[:notice]
  end
end
