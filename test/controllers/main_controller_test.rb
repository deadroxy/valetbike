require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get main_welcome_url
    assert_response :success
  end

  test "should get tutorial" do
    get main_tutorial_url
    assert_response :success
  end

  test "should get help" do
    get main_help_url
    assert_response :success
  end

  test "should get menu" do
    get main_menu_url
    assert_response :success
  end

  test "should get profile" do
    get main_profile_url
    assert_response :success
  end

  test "should get login" do
    get main_login_url
    assert_response :success
  end

  test "should get createAccount" do
    get main_createAccount_url
    assert_response :success
  end

  test "should get rent" do
    get main_rent_url
    assert_response :success
  end

  test "should get return" do
    get main_return_url
    assert_response :success
  end
end
