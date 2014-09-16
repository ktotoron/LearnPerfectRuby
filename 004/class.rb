# encoding=utf-8

class MyClass
  def initialize
    puts 'Initializing'
    @baked = false
  end
  # 破壊的なメソッドには!が必要(慣習)
  def bake!
    @baked = true
  end

  def baked?
    @baked
  end

  DEFAULT_VALUE = 4423
end

MyClass::DEFAULT_VALUE

my_obj = MyClass.new
p my_obj

puts my_obj.baked?
my_obj.bake!
puts my_obj.baked?

# 失敗すると例外の場合は!, falseの場合はなしの慣習もある
# EX) ActiveRecord
# user.save
# user.save!


# Accessor
class Rectangle
  attr_accessor :width, :height
end
class Ruler
  attr_accessor :length

  def self.pair
    [new, new]
  end
  
  # class methodの省略形
  class << self
    def trio
      [new, new, new]
    end
  end
end


(a, b) = Ruler.pair
(c, d, e) = Ruler.trio
a.length = 10
b.length = 20
puts "#{a.length}::#{b.length}"

c.length = 30
d.length = 40
e.length = 50

puts "#{c.length}::#{d.length}::#{e.length}"


puts "==========ClassAccessor=========="

class AccessTest

  # Rubyのprotectedは同じクラスなら違うインスタンスからはアクセス可能
  def protected_method
    "protected_method"
  end

  def private_method
    "private_method"
  end

  def public_method
    "public_method"
  end
  
  # 他のインスタンスのメソッドをcallする
  def call_other_protected_method(other)
    puts other.protected_method
    p other
    puts "call_other_method"
  end

  # setting
  public :public_method
  protected :protected_method
  private :private_method

  private
  # privateなどのアクセス指定子が記述された場合それ以降は、
  # メソッドのアクセス指定子はprivateになる
  def private_method_call
  end
  
end

begin
  acct = AccessTest.new
  puts "public_method::", acct.public_method
  puts acct.private_method
rescue => e
  puts e
end

begin
  acct = AccessTest.new
  puts "public_method::", acct.public_method
  puts acct.protected_method
rescue => e
  puts e
end

puts "==========call_other_method=========="

begin 
  (aca, acb) = [AccessTest.new, AccessTest.new]
  aca.call_other_protected_method acb
rescue => e
  puts "NotCall"
end


puts "==========super_class=========="

# 継承してもインスタンス変数は継承できない

class Parent
  PARENT = 'CONSTANT'
  def initialize
    @ivar = 'content'
  end

  def greet
    puts 'Hi'
  end

  def args_test(name)
    "Hello, #{name}"
  end

  def override_test
    'Hi'
  end
end

class Child < Parent
  PARENT = 'CONSTANT_IN_CHILD'
  def greet
    super
    puts "Hi,HO"
  end

  def args_test(name)
    "Child++, #{super}"
  end
  
  # override
  def override_test(name)
    "Hi, #{name}"
  end
end


puts Child.superclass
child = Child.new
child.greet

puts Child.constants
puts Child::PARENT

puts child.args_test('hahaha')

puts child.override_test('test_override')

# 特異メソッド
puts "==========特異メソッド=========="
class Foo
end

foo = Foo.new
bar = Foo.new

# barのみにメソッドを定義する
def bar.singleton_method
  puts "bar_method_Called"
end

bar.singleton_method

begin
  foo.singleton_method
rescue => e
  puts "Exception::"
  puts e
end

puts "==========class_scope=========="

class ScopeParent
  @@val = 'foo'

  def self.say
    puts @@val
  end
end


class ScopeChild < ScopeParent
  def say
    puts @@val
  end
end


puts "==========define_class=========="
class My
  VALUE = "in_my_class"
  class Sw
    def self.value
      VALUE
    end

  end

end

puts My::Sw.value


VALUE = 'toplevel_VALUE'
class My::Bar
  def self.value
    VALUE
  end
end

puts "#{My::Bar.value}"


















