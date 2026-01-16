require "test_helper"

class RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post replies_url, params: { reply: { content: "aaa", post_id: posts(:one).id } }
    assert_response :success
  end
end
