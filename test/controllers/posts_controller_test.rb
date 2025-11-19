require "test_helper"
 
class PostsControllerTest < ActionDispatch::IntegrationTest
  # これ！ ビューを完全に無効化する
  render_views false
 
  setup do
    @post = Post.create!(content: "test post")
  end
 
  test "should get index" do
    get posts_url
    assert_response :success
  end
 
  test "should get new" do
    get new_post_url
    assert_response :success
  end
 
  test "should get show" do
    get post_url(@post)
    assert_response :success
  end
 
  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end
 
  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: "created" } }
    end
    assert_response :redirect
  end
 
  test "should update post" do
    patch post_url(@post), params: { post: { content: "updated" } }
    assert_response :redirect
  end
 
  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_response :redirect
  end
end