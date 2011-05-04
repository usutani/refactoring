require "test/unit"

require "customer"

class TestCustomer < Test::Unit::TestCase
  def test_regular_and_new_release
    c = Customer.new("Usutani")
    assert_equal(c.statement, "Rental Record for Usutani\nAmount owed is 0\nYou earned 0 frequent renter points")
    c.add_rental(Rental.new(Movie.new("Star Wars Episode IV", Movie::REGULAR), 3))
    assert_equal(c.statement, "Rental Record for Usutani\n\tStar Wars Episode IV\t3.5\nAmount owed is 3.5\nYou earned 1 frequent renter points")
    c.add_rental(Rental.new(Movie.new("Page One", Movie::NEW_RELEASE), 3))
    assert_equal(c.statement, "Rental Record for Usutani\n\tStar Wars Episode IV\t3.5\n\tPage One\t9\nAmount owed is 12.5\nYou earned 3 frequent renter points")
  end
  
  def test_childrens
    c = Customer.new("Usutani")
    c.add_rental(Rental.new(Movie.new("UP!", Movie::CHILDRENS), 3))
    assert_equal(c.statement, "Rental Record for Usutani\n\tUP!\t1.5\nAmount owed is 1.5\nYou earned 1 frequent renter points")
  end

  def test_html
    c = Customer.new("Usutani")
    assert_equal(c.html_statement, "<h1>Rentals for <em>Usutani</em></h1><p>\n<p>You owe <em>0</em><p>\nOn this rental you earned <em>0</em> frequent renter points<p>")
  end
end
