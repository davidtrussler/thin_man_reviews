require "test_helper"

class ReviewTest < ActionDispatch::IntegrationTest
  test "the page correctly renders a theatre review" do
    visit_review_page(1)

    assert_dom "p.review__back-link", text: "Back to reviews"
    assert_dom "p.review__medium", text: "Theatre"
    assert_dom "li.review__title", text: "The Collaboration"
    assert_dom "li.review__extra", text: "By Anthony McCarten"
    assert_dom "li.review__extra-2", text: "Directed by Kwame Kwei-Armah"
    assert_dom "li.review__extra-3", text: "Young Vic, London"
    assert_dom "li.review__extra-4", text: "16 February 2022 to 2 April 2022"
    assert_dom "figcaption.image__caption", text: "Jeremy Pope (left) as Jean-Michel Basquiat and Paul Bettany as Andy Warhol"
    assert_dom "div.review__text", text: "The sound of pounding house music greets the audience entering the theatre. As DJ Xana sets the mood for the action about to unfold lights flash across the auditorium and images of New York from the early eighties are projected onto screens above the stage."
  end

  test "the page correctly renders a cinema review" do
    visit_review_page(2)

    assert_dom "p.review__back-link", text: "Back to reviews"
    assert_dom "p.review__medium", text: "Cinema"
    assert_dom "li.review__title", text: "The Souvenir"
    assert_dom "li.review__extra", text: "Directed by Joanna Hogg"
    assert_dom "li.review__extra-2", text: "With Honor Swinton Byrne, Tom Burke and Tilda Swinton"
    assert_dom "li.review__extra-3", text: "UK, 2019"
    assert_dom "li.review__extra-4", text: "119 minutes"
    assert_dom "figcaption.image__caption", text: "Tom Burke (left) and Honor Swinton Byrne"
    assert_dom "div.review__text", text: "In her fourth feature, Joanna Hogg has dramatised her own experiences of the time she spent at film school. It tells the story of a young student finding her artistic voice as a controlling relationship threatens to destroy it."
  end

  test "the page correctly renders a recorded music review" do
    visit_review_page(3)

    assert_dom "p.review__back-link", text: "Back to reviews"
    assert_dom "p.review__medium", text: "Recorded music"
    assert_dom "li.review__title", text: "Open the Gates"
    assert_dom "li.review__extra", text: "By Irreversible Entanglements"
    assert_dom "li.review__extra-2", text: "International Anthem Recording Company/Don Giovanni Records, 2021"
    assert_dom "figcaption.image__caption", text: "Irreversible Entanglements"
    assert_dom "div.review__text", text: "On Open the Gates Irreversible Entanglements take us on a trip through space and time via poetry and jazz, Latin and Afro-Caribbean beats, avant-garde free improvisation and other-worldly electronics. It’s an enthralling journey."
  end

  test "the page correctly renders a visual art review" do
    visit_review_page(4)

    assert_dom "p.review__back-link", text: "Back to reviews"
    assert_dom "p.review__medium", text: "Visual art"
    assert_dom "li.review__title", text: "Anselm Kiefer: Early Works"
    assert_dom "li.review__extra", text: "Ashmolean Museum, Oxford"
    assert_dom "li.review__extra-2", text: "14 February 2025 to 15 June 2025"
    assert_dom "figcaption.image__caption", text: "Die Etsch (The Adige)"
    assert_dom "div.review__text", text: "What does it mean to be an artist in the wake of the worst atrocity in human history? Is it still possible to produce beauty in such circumstances? How and why do people get seduced by the ideas and reality of genocide? Could it happen again?"
  end

  # Test that the fallback image renders when there is not an image uploaded

  private

  def visit_review_page(id)
    get review_path(id:)
  end
end
