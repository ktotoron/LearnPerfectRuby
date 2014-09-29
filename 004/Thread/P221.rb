fiber = Fiber.new {|f|
  puts f
  second = Fiber.yield('goodbye')
  puts second
  'goodbye(again)'
}

puts fiber.resume('hello')
puts fiber.resume('hello(again)')

fib = Fiber.new {
  a, b = 0, 1

  loop do
    a, b = b, a+b
    Fiber.yield(a)
  end
}

puts 10.times.map {fib.resume}
puts fib.resume
puts fib.resume


