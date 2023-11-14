require "test_helper"

class PastTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get past_trips_index_url
    assert_response :success
  end
end
