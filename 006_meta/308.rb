class Hello
  def hi(name)
    "hi, #{name}"
  end

  private
  def pri_hi(name)
    "pri_hi, #{name}"
  end

  protected
  def pro_hi(name)
    "pro_hi, #{name}"
  end
end

hello = Hello.new

puts "hello.send :hi, 'Rin'         => #{hello.send :hi, 'Rin'         }"
puts "hello.__send__ :hi, 'Rin'     => #{hello.__send__ :hi, 'Rin'     }"    
puts "hello.send :pri_hi, 'Rin'     => #{hello.send :pri_hi, 'Rin'     }"    
puts "hello.__send__ :pri_hi, 'Rin' => #{hello.__send__ :pri_hi, 'Rin' }"        
puts "hello.send :pro_hi, 'Rin'     => #{hello.send :pro_hi, 'Rin'     }"    
puts "hello.__send__ :pro_hi, 'Rin' => #{hello.__send__ :pro_hi, 'Rin' }"        


