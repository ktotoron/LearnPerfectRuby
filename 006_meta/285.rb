puts "=================================================="
puts
add = Proc.new {|x, y| x+y}
inc = add.curry.(1)
puts "add.curry.(1).(3) = #{add.curry.(1).(3)}"
puts "inc.(2) = #{inc.(2)}"
puts "add.curry.('@').('test') = #{add.curry.('@').('test')}"

puts "Proc.new {|y| add.(1,y)}.(5) = #{Proc.new {|y| add.(1,y)}.(5)}"

