require "test_helper"

class MembershipPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get membership_plans_index_url
    assert_response :success
  end
end
