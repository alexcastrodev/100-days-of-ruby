require 'test/unit'

# https://docs.ruby-lang.org/en/3.2/BasicObject.html#method-i-__send__
class Klass
  def hello(*args)
    "Hello " + args.join(' ')
  end

  def say_quack
    "quack"
  end

  def say_aipai(who)
    "#{who}: ain pai"
  end

  private

  def secret(*args)
    "BahGuri " + args.join(' ')
  end

  def private_set_name
    @name = "lekito"
  end

  def private_name
    @name
  end
end

class DayTest < Test::Unit::TestCase
    def test_send_call
      assert_equal(Klass.new.send(:hello, "lekito", "test"), "Hello lekito test")
    end
    
    def test_send_send_private
      assert_equal(Klass.new.send(:secret, "lekito"), "BahGuri lekito")
      
      k = Klass.new
      k.send(:private_set_name)
      name = k.instance_eval { private_name }
      assert_equal(name, "lekito")

      # https://www.notonlycode.org/12-ways-to-call-a-method-in-ruby/
      # public_send is that the latter respects the privacy of methods
      assert_raise NoMethodError do
        k.public_send(:private_set_name)
      end
    end

    def test_call
      k = Klass.new
      assert_raise NoMethodError do
        # NoMethodError: undefined method `call' for #<Klass:0x000000010f187940>
        k.call(:say_quack)
      end

      assert_equal(k.method(:say_aipai).call("derp"), "derp: ain pai")
      assert_equal(k.method(:say_aipai)["snoop"], "snoop: ain pai")
      
      # Using tap
      k.method(:say_aipai).tap do |method|
        assert_equal(method.call("boi"), "boi: ain pai")
      end

      # proc
      assert_equal(:say_aipai.to_proc.call(k, "tabexiga"), "tabexiga: ain pai")
    end

end