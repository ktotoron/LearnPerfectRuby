class Ruler
  # インスタンス変数は@を頭に付ける
  def length=(val)
    @length = val
  end

  def length
    @length
  end
end

ruler = Ruler.new

# syntax sugar
ruler.length = 30
p ruler.length

# accesor
class Ruler2
  # class変数は@@
  @@c_var = "c_var"

  attr_accessor :length

  def display_length
    puts length
  end

  def set_default_length
    self.length = 30
  end

  # class_methodはselfを付ける
  def self.pair
    [self.new(100), self.new(200)]
    # [new, new]
    # [Ruler.new, Ruler.new]
  end

  def initialize(length)
    @length = length
  end

  def cvar_in_method
    p @@c_var
  end

  def self.cvar_in_class_method
    p @@c_var
  end
end



ruler2 = Ruler2.new(100)
ruler2.length = 50
p ruler2.length
ruler2.display_length

pair = Ruler2.pair
ruler2.cvar_in_method
Ruler2.cvar_in_class_method



class Parent
  def hello
    puts 'Hello,Parent'
  end
end

class Child < Parent
  def hi
    puts 'Hi, Child'
  end

  def hello
    super
    puts "Hello, Child"
  end
end 

child = Child.new
child.hello
child.hi


class Whatever 
end
p Whatever.superclass



