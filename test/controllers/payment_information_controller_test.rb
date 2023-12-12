require "test_helper"

class PaymentInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_information_index_url
    assert_response :success
  end
end
