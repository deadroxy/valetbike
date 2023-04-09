require "test_helper"

class RentingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get renting_index_url
    assert_response :success
  end
end
