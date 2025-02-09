require 'test/unit'

module SmileString
  refine String do
    def smile
      "#{self} :)"
    end
  end
end

using SmileString

class DayTest < Test::Unit::TestCase
    def test_my_dsl_included
      assert_equal("Alex".smile, "Alex :)")
    end
end