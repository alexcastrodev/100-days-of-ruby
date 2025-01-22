require 'test/unit'

class E < Enumerator
    def initialize
        super do |y|
            y << 1
            y << 3
        end
    end
end

class DayTest < Test::Unit::TestCase
    def test_instance
      e = E.new
      assert_equal(e.take(2), [1, 3])
    end

    def test_enumerator
        enumerator = [1, 2, 3].each
        assert_equal(enumerator.class, Enumerator)
    end

    def test_object
        e = Object.new

        def e.each
            yield 1
            yield nil
            yield 3
        end
        
        # Transform the object into an enumerator
        e = e.to_enum

        assert_equal(e.next, 1)
        assert_equal(e.next, nil)
        assert_equal(e.next, 3)
    end

    def test_lazy
        enum = (1..Float::INFINITY).lazy
        assert_equal(enum.first(3), [1, 2, 3])
    end
end