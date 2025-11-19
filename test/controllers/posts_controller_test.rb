require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get post_ur(@post)
    assert_response :success
  end

  test "should get new" do
    get new_posts_url
    assert_response :success
  end

  test "should get create" do
    get posts_url
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url
    assert_response :success
  end

  test "should get update" do
    get posts_url(@post)
    assert_response :success
  end

  test "should get destroy" do
    get posts_url(@post)
    assert_response :success
  end
end
