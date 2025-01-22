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