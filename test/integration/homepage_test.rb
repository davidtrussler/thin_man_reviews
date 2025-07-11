require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest
  test "the page lists details of all saved reviews" do
    # Fetch reviews from fixtures
    # test that they are rendering as expected
    visit_homepage

    mediums = ["Theatre", "Cinema", "Recorded music", "Visual art"]
    titles = ["The Collaboration", "The Souvenir", "Open the Gates", "Anselm Kiefer: Early Works"]
    extras = ["By Anthony McCarten", "Directed by Joanna Hogg", "By Irreversible Entanglements", "Ashmolean Museum, Oxford"]

    css_select(".reviews-listing").each_with_index do |listing, index|
      assert_dom listing, "p.listing__medium", mediums[index]
      assert_dom listing, "p.listing__title", titles[index]
      assert_dom listing, "p.listing__extra", extras[index]
    end
  end

  # Test that the fallback image renders when there is not an image uploaded

private
  def visit_homepage
    get root_path
  end
end
