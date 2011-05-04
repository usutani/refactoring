require "test/unit"

require "movie"

class TestMovie < Test::Unit::TestCase
  def test_creation
    m = Movie.new("Star Wars Episode IV", RegularPrice.new)
    assert_equal(m.title, "Star Wars Episode IV")
    assert_equal(m.frequent_renter_points(1), 1)
  end
end
