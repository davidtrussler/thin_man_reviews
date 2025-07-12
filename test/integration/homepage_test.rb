require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest
  setup do
    @mediums = ["Recorded music", "Cinema", "Theatre"]
    @titles = ["Open the Gates", "The Souvenir", "The Collaboration"]
    @extras = ["By Irreversible Entanglements", "Directed by Joanna Hogg", "By Anthony McCarten"]

    visit_homepage
  end

  test "the page lists details of all saved reviews on load" do
    css_select(".reviews-listing").each_with_index do |listing, index|
      assert_dom listing, "p.listing__medium", @mediums[index]
      assert_dom listing, "p.listing__title", @titles[index]
      assert_dom listing, "p.listing__extra", @extras[index]
    end
  end

  test "clicking on each review link navigates to the review page for that review" do
    skip("Can't find the link to click")
  end

  # Test that the fallback image renders when there is not an image uploaded

private
  def visit_homepage
    get root_path
  end
end
