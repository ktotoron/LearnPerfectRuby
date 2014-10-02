puts "lambda, Procは引数の厳密さが違う"

puts Proc.new {|x, y| x}.call(1)
begin
  lambda {|x, y| x}.call(1)
rescue => e
  puts "#{e.class}::#{e}"
end


