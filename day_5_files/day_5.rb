require 'test/unit'
require './math_power_extension'

class DayTest < Test::Unit::TestCase
  def test_patching
    # Monkey patching
    assert_equal(Math.power(5, 2), 25)
  end
  
  def test_power_module
    # Custom Module - C
    assert_equal(LekitoMath.power(5, 2), 25)
  end
end