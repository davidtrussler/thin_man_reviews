require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should return the user to the login page if they do not have permissions with message" do
    get admin_path

    assert_includes flash[:danger], "You do not have the correct permissions for this action"
    assert_redirected_to login_path
  end

  test "should render the Admin landing page if the current user has permissions" do
    @user = users(:david) # User.create(email: "mail@davidtrussler.net")

    reset_session

    get admin_path

    assert_response :success
  end
end
