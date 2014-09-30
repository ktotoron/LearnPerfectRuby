# encoding=utf-8

class Klass
  define_method :instance_method, -> { :instance_method }
end
obj = Klass.new
puts "obj.instance_method = #{obj.instance_method}"

puts "====================IncludeModule===================="

module IncModule
  def inc_mod_method
    :inc_mod_method
  end
end

class IncKlass
  include IncModule
  define_method :inc_mod_method2, IncModule.instance_method(:inc_mod_method)
end

obj = IncKlass.new
puts "obj.inc_mod_method2 = #{obj.inc_mod_method2}"



