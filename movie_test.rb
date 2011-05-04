require "test/unit"

require "movie"

class TestMovie < Test::Unit::TestCase
  def test_creation
    m = Movie.new("Star Wars Episode IV", Movie::REGULAR)
    assert_equal(m.title, "Star Wars Episode IV")
    assert_equal(m.price_code, Movie::REGULAR)
    
    Movie::REGULAR
    Movie::NEW_RELEASE
    Movie::CHILDRENS
  end
end
