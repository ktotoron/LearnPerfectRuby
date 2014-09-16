
class Override
  def ==(other)
    self.class == other.class
  end
end

o1 = Override.new
o2 = Override.new

puts o1 == o2

