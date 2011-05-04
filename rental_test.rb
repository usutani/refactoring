require "test/unit"

require "rental"

class TestRental < Test::Unit::TestCase
  def test_creation
    m = Movie.new("Star Wars Episode IV", Movie::REGULAR)
    r = Rental.new(m, 3)
    assert_equal(r.movie, m)
    assert_equal(r.days_rented, 3)
  end
end
