# docker run --rm -v "$PWD":/app -w /app ruby:3.4.1 ruby day_6.rb
require 'test/unit'

class DayTest < Test::Unit::TestCase
  def test_it_feature
    assert_equal(['Go'].map { "#{it} Rails!" }, ['Go'].map { |item| "#{item} Rails!" })
  end
end

