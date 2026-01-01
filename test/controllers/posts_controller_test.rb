require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  # test "should get new" do
  #  get new_post_url
  #  assert_response :success
  # end

  test "should create post" do
    post posts_url, params: { post: { body: "test" } }
    assert_response :redirect
  end

  test "should get edit" do
    post = posts(:one)
    get edit_post_url(post)
    assert_response :success
  end

  test "should update post" do
    post = posts(:one)
    patch post_url(post), params: { post: { body: "updated" } }
    assert_response :redirect
  end
end



post posts_url, params: {
  post: {
    title: "test",
    content: "hello"
  }
}

assert_redirected_to post_path(Post.last)