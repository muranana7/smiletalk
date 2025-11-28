require "test_helper"
require "securerandom"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # session[:user_id] を作るためにログイン
    post static_pages_login_path, params: { nickname: @user.nickname, password: "password" }
  end

  test "should create user" do
    unique_suffix = SecureRandom.hex(4)
    post users_path, params: {
      user: {
        nickname: "テストユーザー_#{unique_suffix}",
        email: "test_#{unique_suffix}@example.com",
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

