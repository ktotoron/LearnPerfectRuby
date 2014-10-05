
class HaveMethod
  def has_method
    'has_method'
  end

  private
  def pri_method
    :private_method
  end
end

class NotHaveMethod
end

hm = HaveMethod.new
nhm = NotHaveMethod.new

puts "hm.respond_to? :has_method  = #{hm.respond_to? :has_method  }"
puts "nhm.respond_to? :has_method = #{nhm.respond_to? :has_method }" 


puts "==========PrivateMethod=========="
puts "hm.respond_to? :pri_method        = #{hm.respond_to? :pri_method       }" 
puts "hm.respond_to? :pri_method, true  = #{hm.respond_to? :pri_method, true }"       

