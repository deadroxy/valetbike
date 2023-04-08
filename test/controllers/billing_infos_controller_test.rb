require "test_helper"

class BillingInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get billing_infos_new_url
    assert_response :success
  end

  test "should get create" do
    get billing_infos_create_url
    assert_response :success
  end
end
