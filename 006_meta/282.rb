# encoding=utf-8
proc_obj = Proc.new {|a| a}
puts "proc_obj.call(1) = #{proc_obj.call(1)}"
puts "proc_obj[1] = #{proc_obj[1]}"
puts "proc_obj.(1) = #{proc_obj.(1)}"

puts "=================================================="
def proc_factory
  Proc.new
end
block_proc = proc_factory {'MethodBlock'}
puts "block_proc.call = #{block_proc.call}"

begin
  proc_factory
rescue => e
  puts "#{e.class} :: #{e}"
end

puts "=================================================="
puts "Proc#===でProcの実行"
sum_proc = Proc.new {|x, y| x+y}

puts "sum_proc === [1, 2] = #{sum_proc === [1, 2]}"

puts 
puts "=================================================="
def what_class(obj)
  case obj
  when proc {|x| x.kind_of? String}
    String
  when proc {|x| x.kind_of? Numeric}
    Numeric
  else
    Class
  end
end
puts

puts "what_class 'String'  =  #{what_class 'String'}"
puts "what_class 1         =  #{what_class 1}"
puts "what_class []        =  #{what_class []}"

puts 
puts "=================================================="
puts "proc {|a| a}.call(128) = #{proc {|a| a}.call(128)}"

puts 
puts "=================================================="
def convert_proc(&block)
  block
end
puts "convert_proc {|a| a }.call(256) = #{convert_proc {|a| a }.call(256)}"

puts 
puts "=================================================="
def yield_proc
  yield
end
proc_obj = Proc.new {1}
puts "yield_proc &proc_obj = #{yield_proc &proc_obj}"

puts 
puts "=================================================="









