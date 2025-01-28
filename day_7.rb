# docker run --rm -v "$PWD":/app -w /app ruby:3.4.1 ruby day_7.rb
require 'test/unit'

class RactorTest < Test::Unit::TestCase
  def test_thread_race_condition
    sum = 0
    threads = []

    100.times do
      threads << Thread.new do
        1000.times do
          temp = sum
          # Simulate slow calculation
          sleep(0.0001)
          sum = temp + 1
        end
      end
    end

    threads.each(&:join)

    assert_equal(100_000, sum, "Race condition caused incorrect sum!")
  end

  def test_ractor_no_race_condition
    accumulator = Ractor.new do
      sum = 0
      loop do
        msg = Ractor.receive
        break if msg == :done

        sum += msg
      end
      sum
    end

    workers = 100.times.map do
      Ractor.new(accumulator) do |acc|
        1000.times do
          acc.send(1)
        end
      end
    end

    workers.each(&:take)

    accumulator.send(:done)
    final_sum = accumulator.take

    assert_equal(100_000, final_sum, "Ractor ensured correct sum!")
  end
end