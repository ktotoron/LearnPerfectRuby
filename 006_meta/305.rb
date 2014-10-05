class ParentClass
  def s_pub_method; end
  private
  def s_pri_method; end
  protected
  def s_pro_method; end
end

class ChildClass < ParentClass
  def c_pub_method; end
  private
  def c_pri_method; end
  protected
  def c_pro_method; end
end


child = ChildClass.new

def child.s_method; end
def child.singleton_method; end

puts "================================================================================"
puts

puts "child.methods           ===================="
puts child.methods          
puts

puts "child.public_methods    ===================="
puts child.public_methods          
puts

puts "child.protected_methods ===================="
puts child.protected_methods          
puts

puts "child.private_methods   ===================="
puts child.private_methods          
puts

puts "child.s_method          ===================="
puts child.s_method          
puts

puts "child.singleton_method  ===================="
puts child.singleton_methods
puts

