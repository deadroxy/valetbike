require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get Map" do
    get home_Map_url
    assert_response :success
  end

  test "should get Rides" do
    get home_Rides_url
    assert_response :success
  end

  test "should get Pricing" do
    get home_Pricing_url
    assert_response :success
  end

  test "should get Signup" do
    get home_Signup_url
    assert_response :success
  end

  test "should get Login" do
    get home_Login_url
    assert_response :success
  end
end
