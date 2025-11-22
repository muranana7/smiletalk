require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
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
