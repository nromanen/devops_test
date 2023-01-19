# def test_making_order
#   book = Book.new(:title => "RSpec Intro", :price => 20)
#   customer = Customer.new
#   order = Order.new(customer, book)
#   puts 'kkkk'
#   order.submit
#
#   assert(customer.orders.last == order)
#   assert(customer.ordered_books.last == book)
#   assert(order.complete?)
#   assert(!order.shipped?)
# end
require 'test/unit'
require_relative '../src/script'

class OrderTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_fail
    assert(false , 'Assertion was false.')
  end

  def test_script
    expected = 3
    sc = Script.new
    actual = sc.my_method
    assert_equal(expected, actual)
  end
end
