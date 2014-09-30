# encoding=utf-8

puts "特異クラス"

class OrgClass
end

obj = OrgClass.new

def obj.new_singleton_method
  :new_singleton_method
end

puts "obj.class.method_defined? :new_singleton_method = #{obj.class.method_defined? :new_singleton_method}"
puts "obj.singleton_class.method_defined? :new_singleton_method = #{obj.singleton_class.method_defined? :new_singleton_method}"


puts "=================================================="
class Klass; end
klass = Klass.new

puts klass.singleton_class
KLASS_OBJECT = klass
class << klass; self; 
end == KLASS_OBJECT.singleton_class



