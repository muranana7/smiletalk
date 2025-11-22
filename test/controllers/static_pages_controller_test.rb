require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # login_pass にアクセスできるように session にユーザーIDをセット
    post static_pages_login_path, params: { nickname: @user.nickname, password: "password" }
  end

  test "should get login" do
    get static_pages_login_path
    assert_response :success
  end

  test "should get login_new" do
    get static_pages_login_new_path
    assert_response :success
  end

  test "should get login_pass" do
    get static_pages_login_pass_path
    assert_response :success
  end
end
