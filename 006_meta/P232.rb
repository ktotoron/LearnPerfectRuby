# encoding=utf-8

puts Class.ancestors
puts Class.instance_methods(false)

puts "===================="
FirstClass = Class.new
fc_instance = FirstClass.new
puts fc_instance.class.name

puts "===================="
SecondClass = Class.new(FirstClass)
puts SecondClass.superclass

puts "===================="
klass_object = nil
ThirdClass = Class.new do |klass|
  klass_object = klass

  def hello
    :hello
  end
end

puts klass_object == ThirdClass
thc_instance = ThirdClass.new
puts thc_instance.hello

puts "===================="
klass = Class.new
puts klass.name == nil

puts "===================="
obj = klass.new
puts obj.class

puts "===================="
NamedKlass = klass
puts klass.name

puts "===================="

ext_scope = 1

begin 
  class ScopeTestClass_1
    puts ext_scope
  end
rescue => e
  puts "#{e.class}::#{e}"
end

ScopeTestClass_2 = Class.new do
  puts ext_scope
end
















