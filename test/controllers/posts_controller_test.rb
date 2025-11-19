require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one) 
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should get create" do
    post posts_url
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should get update" do
    patch post_url(@post)
    assert_response :success
  end

  test "should get destroy" do
    delete post_url(@post)
    assert_response :success
  end
end
