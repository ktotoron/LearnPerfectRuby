module ExMod
  def ex_method
    :ex_method
  end
end

obj = Object.new
puts "#{obj.singleton_class.ancestors}"
puts "=================================================="
obj.extend ExMod

puts "#{obj.ex_method}"
puts "=================================================="

puts "#{obj.singleton_class.ancestors}"
puts "=================================================="


