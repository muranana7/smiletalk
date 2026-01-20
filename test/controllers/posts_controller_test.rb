require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ユーザーと投稿は作るけどログインはしない
    @user = User.create!(nickname: "tester", email: "tester@example.com", password: "password")
    @post = Post.create!(title: "寿司食べたい", content: "テスト投稿", user: @user)
  end

  test "index should be accessible without login" do
    get posts_url
    assert_response :success
  end

  test "show should be accessible without login" do
    get post_url(@post)
    assert_response :success
  end

  test "new should redirect to login without login" do
    get new_post_url
    assert_redirected_to static_pages_index_path
  end

  test "create should redirect to login without login" do
    post posts_url, params: { post: { title: "test", content: "aaa", user_id: @user.id } }
    assert_redirected_to static_pages_index_path
  end

  test "edit should redirect to login without login" do
    get edit_post_url(@post)
    assert_redirected_to static_pages_index_path
  end

  test "update should redirect to login without login" do
    patch post_url(@post), params: { post: { title: "updated" } }
    assert_redirected_to static_pages_index_path
  end

  test "destroy should redirect to login without login" do
    assert_no_difference("Post.count") do
      delete post_url(@post)
    end
    assert_redirected_to static_pages_index_path
  end
end
