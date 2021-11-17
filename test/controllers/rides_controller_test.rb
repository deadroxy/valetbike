require "test_helper"

class RidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rides_index_url
    assert_response :success
  end
end
