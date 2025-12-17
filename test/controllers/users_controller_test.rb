require "test_helper"
require "securerandom"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post static_pages_login_path, params: { nickname: @user.nickname, password: "password" }
    assert_response :success
  end

  test "should create user" do
    unique_suffix = SecureRandom.hex(4)
    post users_path, params: {
      user: {
        nickname: "テストユーザー_#{unique_suffix}",
        email: "test_#{unique_suffix}@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert-success", "新規登録が完了しました"
  end

  test "should update password" do
    patch update_password_path, params: {
      user: { password: "newpassword", password_confirmation: "newpassword" }
    }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert-success", "パスワードを更新しました"
  end
end
