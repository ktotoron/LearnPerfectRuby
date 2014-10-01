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

puts
puts "=================================================="

puts
puts "=================================================="

