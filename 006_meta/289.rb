args_proc = Proc.new {|x, y| [x, y]}
puts "#{args_proc[1,2,3]}"
puts "#{args_proc[1]}"
puts "#{args_proc[[1,2]]}"

args_lambda = lambda {|x, y| [x, y]}
begin
  puts "#{args_lambda[1,2,3]}"
rescue => e
  puts "#{e.class}::#{e}"
end


begin
  puts "#{args_lambda[1]}"
rescue => e
  puts "#{e.class}::#{e}"
end

begin
  puts "#{args_lambda[[1,2]]}"
rescue => e
  puts "#{e.class}::#{e}"
end

puts proc {}.lambda?
puts lambda {}.lambda?
puts 1.method(:+).to_proc.lambda?


puts "=================================================="
def create_proc
  str = 'from create_proc'
  Proc.new {str}
end

proc_obj = create_proc

str = 'from top'
puts proc_obj.call


top_level_proc = Proc.new {str}
puts top_level_proc.call
str += ' append'
puts top_level_proc.call


