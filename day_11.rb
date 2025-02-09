require 'test/unit'
require_relative './helpers/dsl'

# What the f**k is using
# Let's include this to day 12? haha
using DontKnowable

class MyDsl
  include Smileable
  smile :name
  dontknow :pet
end

class DayTest < Test::Unit::TestCase
    def test_my_dsl_included
      smile = MyDsl.new
      smile.name = "Alex"
      smile.pet = "Who?"

      assert_equal(smile.name, "Alex :)")
      assert_equal(smile.pet, "Who? ¯\_(ツ)_/¯")
    end
end