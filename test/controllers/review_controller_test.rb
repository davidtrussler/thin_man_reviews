require "test_helper"

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get review page" do
    get review_path
    assert_response :success
    assert_select "title", "Review | Thin Man Reviews"
  end
end
