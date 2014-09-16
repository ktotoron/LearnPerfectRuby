def hello(names)
  names.each do |name|
    puts "HELLO, #{name.upcase}"
  end

  names.each { |name| puts "Hello, #{name.upcase}" }
end



rubies = ['MRI', 'Jruby', 'rubinius']

hello(rubies)


