require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get show" do
    user = User.create!(nickname: "tester", email: "tester@example.com", password: "password")
    post = Post.create!(title: "寿司食べたい", content: "テスト投稿", user: user)

    get post_url(post)
    assert_response :success
  end


  test "should get new" do
    get posts_new_url
    assert_response :success
  end

  test "should get create" do
    get posts_create_url
    assert_response :success
  end

  test "should get edit" do
    get posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get posts_update_url
    assert_response :success
  end

  test "should destroy post" do
    user = User.create!(nickname: "tester", email: "tester@example.com", password: "password")
    post = Post.create!(title: "寿司食べたい", content: "テスト投稿", user: user)

    login_as(user) do
      assert_difference("Post.count", -1) do
        delete post_url(post)
      end
    end

    assert_redirected_to static_pages_index_path
  end
end
