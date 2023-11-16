require "test_helper"

class EditCurrentTripControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get edit_current_trip_index_url
    assert_response :success
  end
end
