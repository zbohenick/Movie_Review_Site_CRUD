require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "should not save movie without title or description" do
    movie = Movie.new
    assert_not movie.valid?
    assert_equal [:title, :description], movie.errors.keys
  end
end
