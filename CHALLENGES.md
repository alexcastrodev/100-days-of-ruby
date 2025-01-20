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