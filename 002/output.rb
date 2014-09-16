puts "====================puts===================="
print "print\n"
puts sprintf('%04d::%s', 200, 'string')

class Ruler
  def initialize(length)
    @length = length
  end

  def to_s
    '=' * @length
  end

  def inspect
    "Ruler(length: #{@length})"
  end
end



ruler = Ruler.new(30)
puts ruler
p ruler

puts "====================gets===================="

a = Integer(gets)
b = Integer(gets)

puts "Total: #{a+b}"


# ARGV, ARGFが入出力の根幹

