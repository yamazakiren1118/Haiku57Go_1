require 'test_helper'

class ChatCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get chat_comments_create_url
    assert_response :success
  end

end
