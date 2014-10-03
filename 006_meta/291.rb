double = Proc.new {|x|x*2}
array = [1, 2, 3, 4, 5]
array_shift = array.method(:shift)
puts "array_shift.call = #{array_shift.call}"
puts "array = #{array}"

puts "===================="

class Dog
  def bark
    'wan!'
  end
end

dog = Dog.new
bark_wan = dog.method(:bark)


class Dog
  def bark
    'bowwow!'
  end
end
bark_bowwow = dog.method(:bark)

puts "bark_wan = #{bark_wan.call}"
puts "bark_bowwow = #{bark_bowwow.call}"





