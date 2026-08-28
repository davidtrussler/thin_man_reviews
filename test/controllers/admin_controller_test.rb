require "test_helper"
# require "sessions_helper"
# require "../admin_controller"

class AdminControllerTest < ActionDispatch::IntegrationTest
  # def setup
    # reset_session
    # log_in(:david)
  #   @user = users(:david)
  # end

  test "should return the user to the login page if they do not have permissions with message" do
    get admin_path

    assert_includes flash[:danger], "You do not have the correct permissions for this action"
    assert_redirected_to login_path
  end

  test "should render the Admin landing page if the current user has permissions" do
    user = users(:david) # User.create(email: "mail@davidtrussler.net")

    puts "++user++"
    puts user
    puts "++++"

    # sign_in_as(user)
    # SessionsHelper::log_in(user)

    # require_permissions = true
    # @current_user = user

    # reset_session
    # log_in user    # @current_user = users(:david)
    # sign_in_as users(:david)
    # SessionsHelper::log_in(:david)

    # puts "++@current_user++"
    # puts @current_user
    # puts "++++"

    get admin_path # , params: { user_id: user.id }

    # session[:user_id] = user.id

    # puts "++current_user++"
    # puts @current_user
    # puts "++++"

    # puts "++controller++"
    # puts @controller.action_name
    # puts "++++"

    # puts "++request++"
    # puts @request
    # puts "++++"

    # puts "++response++"
    # puts @response.body
    # puts "++++"

    # puts "++session++"
    # puts session[:user_id]
    # puts "++++"

    # get :show
    # assert true
    # assert_template "admin/show"
    assert_response :success
  end

  def sign_in_as(user)
    # post sign_in_url(email: user.email, password: user.password)
    # log_in(user)
    puts "++user++"
    puts user
    puts "++++"

    log_in(user)

    # post login_path, params: {
    #   session: {
    #     email: user.email,
    #     password: user.password
    #   }
    # }
  end

  # def login_as(user)
  #   request.env["warden"] = stub(authenticate!: true, authenticated?: true, user:)
  # end

  # def log_in_as(user)
  #   log_in(user)
  # end
end
