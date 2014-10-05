class MethodInfo
  def sample_method; end
end

obj = MethodInfo.new
sam_method = obj.method(:sample_method)
puts "sam_method.owner    = #{  sam_method.owner        }"
puts "sam_method.name     = #{  sam_method.name         }"
puts "sam_method.receiver = #{  sam_method.receiver     }"
puts "sam_method.receiver == obj  = #{  sam_method.receiver == obj    }"

puts
puts
puts "=================================================="
puts "==========UnboundMethod=========="
puts "==========Module#instance_method=========="
puts Array.instance_method(:shift)
puts [].method(:shift).unbind


puts "=================================================="
ub_s_op = Array.instance_method(:<<)

puts "ub_s_op = #{ub_s_op}"

puts "ub_s_op.arity      = #{ub_s_op.arity     }" 
puts "ub_s_op.parameters = #{ub_s_op.parameters}"      
puts "ub_s_op.owner      = #{ub_s_op.owner     }" 
puts "ub_s_op.name       = #{ub_s_op.name      }"

puts "=================================================="
ub_s = [].method(:shift).unbind
puts "ub_s.bind([1,2,3])      = #{ub_s.bind([1,2,3])       }"
puts "ub_s.bind([1,2,3]).call = #{ub_s.bind([1,2,3]).call  }"     

puts
puts "=================================================="

class SKlass
  def s_method
    self.class
  end
end

class Klass < SKlass
end

class NoInheritKlass
  def s_method
    self.class
  end
end

sk = SKlass.new
klass = Klass.new
nhk = NoInheritKlass.new

ub_s_method = SKlass.instance_method(:s_method)

puts "ub_s_method.bind(sk).call    = #{ub_s_method.bind(sk).call   }" 
puts "ub_s_method.bind(klass).call = #{ub_s_method.bind(klass).call}"    
begin
  puts "ub_s_method.bind(nhk).call   = #{ub_s_method.bind(nhk).call  }"  
rescue => e
  puts "#{e.class}:#{e}"
end





