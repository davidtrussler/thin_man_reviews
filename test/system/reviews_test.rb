require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  test "links on reviews listing display the correct review" do
    visit_homepage
    click_on "Theatre The Collaboration By Anthony McCarten"

    assert_selector "p.review__back-link", text: "Back to reviews"
    assert_selector "p.review__medium", text: "THEATRE"
    assert_selector "li.review__title", text: "The Collaboration"
    assert_selector "li.review__extra", text: "By Anthony McCarten"
    assert_selector "li.review__extra-2", text: "Directed by Kwame Kwei-Armah"
    assert_selector "li.review__extra-3", text: "Young Vic, London"
    assert_selector "li.review__extra-4", text: "16 February 2022 to 2 April 2022"
    assert_selector "figcaption.image__caption", text: "Jeremy Pope (left) as Jean-Michel Basquiat and Paul Bettany as Andy Warhol"
    assert_selector "div.review__text", text: "The sound of pounding house music greets the audience entering the theatre. As DJ Xana sets the mood for the action about to unfold lights flash across the auditorium and images of New York from the early eighties are projected onto screens above the stage."
  end

private
  def visit_homepage
    visit root_path
  end
end
