lambda_obj = lambda {1}
puts "lambda_obj.class = #{lambda_obj.class}"
puts "lambda_obj.call = #{lambda_obj.call}"

puts
puts "=================================================="
inc = ->(x) {x+1}
puts "inc.(5) = #{inc.(5)}"

puts
puts "=================================================="

puts "Kernel#ProcとKernel#lambdaでは動作が少し違うP287"

puts
puts "=================================================="
def proc_return
  # methodを抜ける
  Proc.new {return 1; puts :unreadable}.call
end

def lambda_return
  # 制御を抜ける
  lambda {return 1; puts :unreadable}.call
  :readable
end

puts "proc_return    =   #{proc_return   }"
puts "lambda_return  =   #{lambda_return }"

lambda { return 1; puts :unreadable }.call


puts
puts "=================================================="

begin
  Proc.new {break 1; puts :unreadable }.call
rescue => e
  puts "#{e.class}::#{e}"
end

def proc_break
  Proc.new {break 1; puts :unreadable }.call
end

begin
  proc_break
rescue => e
  puts "#{e.class}::#{e}"
end


puts
puts "=================================================="
puts lambda {break 1; puts :unreadable}.call

def lambda_break
  lambda {break 1; puts :unreadable}.call
  :readable
end
puts lambda_break

puts
puts "=================================================="

def wrap_method(proc_or_lambda)
  x = proc_or_lambda.call(1)
  x.to_s
end

puts wrap_method proc {|x| next x; x.succ}
puts wrap_method lambda {|x| next x; x.succ}


