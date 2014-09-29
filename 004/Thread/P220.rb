fiber = Fiber.new {
  puts "Hello, Fiber"
  Fiber.yield
  puts "Hello, Fiber(again)"
}

fiber.resume
fiber.resume
begin
  fiber.resume
rescue => e
  puts "#{e.class}::#{e}"
end








