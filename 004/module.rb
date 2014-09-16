# encoding=utf-8

module ModuleTest
  def self.lot
    %w(b a c p).sample # Array#sampleはランダム抽出
  end

  module ChildModule
    def self.lot
      %w(x y z).sample
    end
  end
end

puts ModuleTest.lot
puts ModuleTest.lot

puts ModuleTest::ChildModule.lot


puts "==========Mix-in=========="

module Greetable
  def greet_to(name)
    puts "Hello, #{name}, Class name is #{self.class}."
  end

  def greet_to_override(name)
    puts "greet_to_override:: Hello, #{name}, Class name is #{self.class}."
  end
end


class Alice
  include Greetable

  def greet_to_override(name)
    super
    puts "Nice to meet you."
  end
end

alice = Alice.new
alice.greet_to 'Bob'
alice.greet_to_override 'Bob'


puts "==========Mix-in_FriendList=========="

class FriendList
  # mix-inは複数可能
  include Enumerable

  def initialize(*friends)
    @friends = friends
  end

  def each
    for v in @friends
      yield v
    end
  end

end

friend_list = FriendList.new('Alice', 'Bob', 'Charlie')

puts "friend_list.count :: #{friend_list.count}"
puts "friend_list.map{|v| v.upcase} :: #{friend_list.map{|v| v.upcase}}"
puts "friend_list.find{|v| /b/ === v} :: #{friend_list.find{|v| /b/ === v}}"

puts "==========Mix-in_include=========="

module ModuleA
  def from_a
    puts 'A'
  end
end

module ModuleB
  def from_b
    puts 'B'
  end
end

class MyClass
  include ModuleA
  include ModuleB
end

my_obj = MyClass.new
my_obj.from_a
my_obj.from_b


puts "==========Mix-in_module=========="
module ModuleC
  def from_c
    'C'
  end
end

module ModuleD
  include ModuleC
  def from_d
    'D'
  end
end

class Class_Mix_in
  include ModuleD
end

my_obj = Class_Mix_in.new
puts "my_obj.from_c :: #{my_obj.from_c}"
puts "my_obj.from_d :: #{my_obj.from_d}"

puts "==========include_method_extend=========="
module GreetableModule
  def greet_to(name)
    "Hello, #{name}, Class name is #{self.class}"
  end
end

obj = Object.new
obj.extend GreetableModule

puts "obj.greet_to 'World':: #{obj.greet_to 'World'}"

class Alice_extends
  extend GreetableModule
end

# class_methodのmix-in
alice = Alice_extends.new
puts "Alice_extends.greet_to 'Alice_extends' :: #{Alice_extends.greet_to 'Alice_extends'}"

puts "==========ModuleFunc=========="
puts "Math.sqrt(4) :: #{Math.sqrt(4)}"
include Math
puts "sqrt(9) :: #{sqrt(9)}"


module MyFunctions
  def my_module_func
    'Called'
  end
  module_function :my_module_func

  # module関数のの複数定義
  module_function
  def my_module_func_1
    'my_module_func_1'
  end

  def my_module_func_2
    'my_module_func_2'
  end
end

puts "MyFunctions.my_module_func :: #{MyFunctions.my_module_func}"
puts "MyFunctions.my_module_func_1 :: #{MyFunctions.my_module_func_1}"
puts "MyFunctions.my_module_func_2 :: #{MyFunctions.my_module_func_2}"

# autoload :Class, 'file_name'
# autoload :Module, 'file_name'

puts "=========="
















