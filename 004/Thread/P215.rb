t = Thread.fork {
  Thread.stop
  puts "hi"
}
puts t.status
sleep 1
puts t.status
t.run

