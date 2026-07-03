require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get the Admin landing page" do
    get admin_path
    assert true
  end
end
