require "test_helper"

class RentalControllerTest < ActionDispatch::IntegrationTest
  test "should get rent" do
    get rental_rent_url
    assert_response :success
  end
end
