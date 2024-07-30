require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "home page" do
    get root_path

    assert_template 'home/show'
    assert_select "a[href=?]", review_path, count: 3
  end

  test "review page" do
    get review_path

    assert_template 'review/show'
    assert_select "a[href=?]", root_path
  end
end
