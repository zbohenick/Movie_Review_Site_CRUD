require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "should not save without the necessary required validators" do
    review = Review.new
    assert_not review.valid?
    assert_equal [:review, :headline, :body], review.errors.keys
  end
end
