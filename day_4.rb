require 'test/unit'
require_relative './helpers/active_support'
require_relative './helpers/active_module'

# Patching
class ActiveSupport
  def say_high(word)
    word.upcase
  end

  def say_reverse(word)
    word.reverse.upcase
  end
end

module ActiveModule
  def say_high(word)
    word.upcase
  end
end

class DayTest < Test::Unit::TestCase
    def test_class_support
      assert_equal(ActiveSupport.new.say("hello"), 'hello')
      assert_equal(ActiveSupport.new.say_high("hello"), 'HELLO')
      assert_equal(ActiveSupport.new.say_reverse("hello"), 'OLLEH')
    end

    def test_module_support
      active_module = Object.new
      active_module.extend(ActiveModule)
      assert_equal(active_module.say("hello"), 'hello')
      assert_equal(active_module.say_high("hello"), 'HELLO')
    end
end

