require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
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

  # パスワード更新のテスト例
  test "should update password" do
    user = users(:one) # fixtures で定義されているユーザー
    patch update_password_path, params: {
      password: "newpassword",
      password_confirmation: "newpassword"
    }, session: { user_id: user.id }
    assert_redirected_to root_path
    assert_equal "パスワードを更新しました", flash[:notice]
  end
end
