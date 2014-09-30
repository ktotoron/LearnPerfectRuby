puts "singleton_classを持てないオブジェクト"

begin
  puts "1.singleton_class = #{1.singleton_class}"
rescue => e
  puts "#{e.class}::#{e}"
end

begin
  puts ":symbol.singleton_class = #{:symbol.singleton_class}"
rescue => e
  puts "#{e.class}::#{e}"
end

begin
  puts "true.singleton_class = #{true.singleton_class}"
rescue => e
  puts "#{e.class}::#{e}"
end

begin
  puts "nil.singleton_class = #{nil.singleton_class}"
rescue => e
  puts "#{e.class}::#{e}"
end



