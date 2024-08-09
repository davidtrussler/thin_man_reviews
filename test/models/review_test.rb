require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = Review.new(title: "The Collaboration")
  end

  test "the title" do
    assert_equal "The Collaboration", @review.title
  end
end
