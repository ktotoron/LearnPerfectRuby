current = Thread.current
puts "current.priority = #{current.priority}"

Thread.fork do
  puts Thread.current.priority
end

sleep 1

