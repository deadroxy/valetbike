require "test_helper"

class AddMoreTimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get add_more_time_index_url
    assert_response :success
  end
end
