require 'test_helper'

class HaikusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get haikus_index_url
    assert_response :success
  end

end
