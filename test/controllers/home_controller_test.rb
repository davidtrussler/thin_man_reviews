require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get root_url
    assert_response :success
    assert_select "title", "Thin Man Reviews"
  end
end
