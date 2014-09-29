t = Thread.fork {sleep 1}
puts "t.status = #{t.status}"
puts "t.alive? = #{t.alive?}"
puts "t.stop?  = #{t.stop?}"








