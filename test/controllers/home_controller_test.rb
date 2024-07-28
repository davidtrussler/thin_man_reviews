require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get home_show_url
    assert_response :success
    assert_select "title", "Home | Thin Man Reviews"
  end
end
