array = [1, '2', [3], Time.now]

m = Marshal.dump(array)
puts "#{Marshal.load(m)}"


class Something
  attr_accessor :source, :temporary

  def marshal_dump
    source
  end

  def marshal_load(s)
    self.source = s
  end
end

org = Something.new
org.source = 'necessary'
org.temporary = 'drop data'

data = Marshal.dump(org)
restored = Marshal.load(data)
puts restored.source
puts restored.temporary



