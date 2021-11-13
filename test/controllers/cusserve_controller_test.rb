require "test_helper"

class CusserveControllerTest < ActionDispatch::IntegrationTest
  test "should get contacs" do
    get cusserve_contacs_url
    assert_response :success
  end
end
