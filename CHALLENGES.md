# Day 1

## Short reduce

Usually, a reduce syntax is like:

```ruby
[3,2].reduce { |acumulador, numero| acumulador + numero }
```

Also, we can use symbol for represent the operation, like:

```ruby
[3,2].reduce(:+) # 5
```

We can use this for multiplication, subtraction, and others operators.

# Notes

Reduce is an alias for Enumerable inject, and has the same implementation.

https://ruby-doc.org/3.4.1/Enumerable.html#method-i-inject

[See example](./day_1.rb)


# Day 2

[Enumerator](https://ruby-doc.org/core-2.6/Enumerator.html) is a class which allows both internal and external iteration.

the Array class has proprietary methods (enumerable) for accessing, searching and otherwise manipulating arrays.

Like all classes that include the Enumerable module, [Array](https://ruby-doc.org/core-2.6/Array.html) has an each method, which defines what elements should be iterated over and how. In case of Array's each, all elements in the Array instance are yielded to the supplied block in sequence.

for example:

```ruby
[1, 2, 3].each.class # Enumerable 
```

The doc says: "Most methods have two forms: a block form where the contents are evaluated for each item in the enumeration, and a non-block form which returns a new Enumerator wrapping the iteration"

Let's see about: a block form where the contents are evaluated for each item in the enumeration

```ruby
[1, 2, 3].each do |item|
  puts item * 2
end
```

And, a non-block form which returns a new Enumerator wrapping the iteration

```ruby
enum = [1, 2, 3].each
puts enum.next  # => 1 (first element)
puts enum.next  # => 2 (second element)
puts enum.next  # => 3 (third element)
```

Notes:

With an enumerator, we can use lazy evaluation to allocate data on demand:

instead using eager:
```ruby
enum = (1..Float::INFINITY).to_a
```
We can lazy:

```ruby
enum = (1..Float::INFINITY).lazy
puts enum.first(3) # [1, 2, 3]
```

[See example](./day_2.rb)

# References:

https://github.com/ruby/ruby/blob/master/enumerator.c

https://github.com/ruby/ruby/blob/master/array.c

https://ruby-doc.org/core-2.6/Enumerator.html

https://ruby-doc.org/core-2.6/Array.html


# Day 3

Priority Queue

Ruby has a built-in gem called syntax suggest, that you can use PriorityQueue Data Structure

https://github.com/ruby/syntax_suggest/blob/main/lib/syntax_suggest/priority_queue.rb

[See example](./day_3.rb)

# Day 4

Monkey Patching

In Ruby, a Monkey Patch (MP) is referred to as a dynamic modification to a class and by a dynamic modification to a class means to add new or overwrite existing methods at runtime.

[See example](./day_4.rb)

https://www.geeksforgeeks.org/monkey-patching-in-ruby/

https://shopify.engineering/the-case-against-monkey-patching

# Day 5

mkmf.rb is used by Ruby C extensions to generate a Makefile which will correctly compile and link the C extension to Ruby and a third-party library.

The focus here is to create a power method for the Math module. Although the Math module already includes this functionality, this exercise aims to learn how to interoperate with a C native module.

[See example](./day_5.rb)

Also, you can see the power_extension

[See example](./power_extension/power_extension.c)

# Day 6

it is added to reference a block parameter with no variable name

```ruby
# In Ruby 3.4.x:
['Go'].map { "#{it} Rails!" }
# => ["Go Rails!"]

# In Ruby 3.3.x and earlier:
['Go'].map { |item| "#{item} Rails!" }
# => ["Go Rails!"]
```

it very much behaves the same as _1. When the intention is to only use _1 in a block, the potential for other numbered parameters such as _2 to also appear imposes an extra cognitive load onto readers. So it was introduced as a handy alias. Use it in simple cases where it speaks for itself, such as in one-line blocks.

[See example](./day_6.rb)

https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-0-released/

# Day 7

Ractor is a Actor-model abstraction for Ruby that provides thread-safe parallel execution.

Ractors do not share usual objects, so the some kind of thread-safety concerns such as data-race, race-conditions are not available on multi-ractor programming.

To achieve this, ractors severely limit object sharing between different ractors. For example, unlike threads, ractors can't access each other's objects, nor any objects through variables of the outer scope.

https://ruby-doc.org/core-3.0.2/Ractor.html

https://www.speedshop.co/2020/05/11/the-ruby-gvl-and-scaling.html

https://docs.appsignal.com/ruby/integrations/global-vm-lock.html

https://rubykaigi.org/2023/presentations/KnuX.html


[See example](./day_7.rb)

# Day 8

Using the "c_call" event, you are notified whenever a C implementation is invoked, such as Array or String methods. Additionally, you can access detailed information using TracePoint's features

[See example](./day_8.rb)

# Day 9

I can create a CLI that append file using File module and ARGV to read command line arguments.

https://ruby-doc.org/core-2.5.5/File.html

https://www.rubyguides.com/2015/05/working-with-files-ruby/

[See example](./day_9.rb)
