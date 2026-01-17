require "test_helper"

class RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post_record = posts(:one)

    post post_replies_url(post_record), params: {
      reply: {
        content: "aaa"
      }
    }

    assert_response :redirect
  end
end
