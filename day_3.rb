require 'syntax_suggest/priority_queue'
require 'test/unit'

class DayTest < Test::Unit::TestCase
    def test_priority_queue
      queue = SyntaxSuggest::PriorityQueue.new
        queue << 33
        queue << 44
        queue << 1
        assert_equal(queue.peek, 44)
    end
end