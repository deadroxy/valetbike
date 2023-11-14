require "test_helper"

class ActiveTripControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get active_trip_index_url
    assert_response :success
  end
end
