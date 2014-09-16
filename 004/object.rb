puts "==========Object=========="

class MyClass
end

o = Object.new
puts "o.class :: #{o.class}"
puts "o.is_a?(Object) :: #{o.is_a?(Object)}"
puts "o.object_id :: #{o.object_id}"
puts "o.nil? :: #{o.nil?}"
puts "o.frozen? :: #{o.frozen?}"
o.tap{ |v| puts v }

puts Object.new == Object.new
puts [1,2,3] == [1,2,3]
puts /pat/ == /pat/

puts "==========class=========="
class EqualClass
  attr_accessor :length
  def initialize(length)
    self.length = length
  end

  def ==(other)
    length == other.length
  end
end

puts "==========equal=========="
equal1 = EqualClass.new(10)
equal2 = EqualClass.new(10)

puts equal1 == equal2
equal1.length = 40
puts equal1 == equal2
puts equal1 != equal2

puts "==========freeze=========="
puts "equal1.frozen? :: #{equal1.frozen?}"
equal1.freeze
puts "equal1.frozen? :: #{equal1.frozen?}"

begin
  equal1.extend Enumerable
rescue => e
  puts "enum"
  puts e
end


puts "==========object_copy=========="
org = Object.new
puts org.object_id
puts org.freeze

puts "=====dup(shallow copy)====="
copy_dup = org.dup
puts copy_dup.object_id
puts copy_dup.frozen?

puts "=====clone(deep copy)====="
copy_clone = org.clone
puts copy_clone.object_id
puts copy_clone.frozen?

puts "==========pollution_object=========="
# 外部入力は汚染されたオブジェクトとして扱われる
puts Object.new.tainted?
puts ENV['HOME'].tainted?
# 汚染は引き継がれる

puts "$SAFE=#{$SAFE}"





















