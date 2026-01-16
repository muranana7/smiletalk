require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    user = User.create!(nickname: "tester", email: "tester@example.com", password: "password")
    post = Post.create!(title: "寿司食べたい", content: "テスト投稿", user: user)

    get post_url(post)
    assert_response :success
  end


  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should get create" do
    post posts_url, params: { post: { title: "test", content: "aaa" } }
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(post(:one))
    assert_response :redirect
  end

  test "should get update" do
    post_record = posts(:one)
    patch post_url(post_record), params: { post: { title: "updated" } }
    assert_response :redirect
  end

  test "should not destroy post without login" do
    post = posts(:one)

    assert_no_difference("Post.count") do
      delete post_url(post)
    end

    assert_redirected_to static_pages_index_path
  end
end
