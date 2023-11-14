require "test_helper"

class LoginSignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get login_sign_up_index_url
    assert_response :success
  end
end
