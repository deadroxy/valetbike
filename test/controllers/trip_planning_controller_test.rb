require "test_helper"

class TripPlanningControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trip_planning_index_url
    assert_response :success
  end
end
