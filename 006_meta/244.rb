# encoding=utf-8

puts "==========MethodTransplanting=========="
puts "必要なメソッドだけ利用"

module UnIncModule
  def un_inc_mod_method
    :un_inc_mod_method
  end
end

class Klass
  define_method :un_inc_mod_method, UnIncModule.instance_method(:un_inc_mod_method)
end

obj = Klass.new
puts "obj.un_inc_mod_method = #{obj.un_inc_mod_method}"



