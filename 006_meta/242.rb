# encoding=utf-8

class Klass
  define_method :instance_method, -> { :instance_method }
end
obj = Klass.new
puts "obj.instance_method = #{obj.instance_method}"






