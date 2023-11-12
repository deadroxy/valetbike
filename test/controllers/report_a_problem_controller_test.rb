require "test_helper"

class ReportAProblemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get report_a_problem_index_url
    assert_response :success
  end
end
