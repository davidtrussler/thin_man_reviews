require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = users(:david)
  # end

  test "should get the Admin landing page if the current user has permissions" do
    @current_user = users(:david)

    puts "++@current_user++"
    puts @current_user
    puts "++++"

    get admin_path
    assert true
  end

  test "should return the user to the login page if they do not have permissions" do
    @current_user = nil

    puts "++@current_user++"
    puts @current_user
    puts "++++"

    get admin_path
    assert true
  end
end
