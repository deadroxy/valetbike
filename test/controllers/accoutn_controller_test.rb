require "test_helper"

class AccoutnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accoutn_index_url
    assert_response :success
  end
end
