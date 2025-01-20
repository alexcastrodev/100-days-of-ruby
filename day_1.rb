require 'test/unit'

class DayTest < Test::Unit::TestCase
  def test_sum
    arr = [2, 4, 6, 8]
    assert_equal(arr.reduce(:+), 20)
  end

  def test_enumerable_inject
    arr = [2, 4, 6, 8]
    assert_equal(arr.inject(:+), 20)
  end

  def test_subtract
    arr = [10, 2]
    assert_equal(arr.reduce(:-), 8)
  end


  def test_multiply
    arr = [10, 10]
    assert_equal(arr.reduce(:*), 100)
  end
end
