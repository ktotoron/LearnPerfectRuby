puts "(0..10).map &2.method(:*).to_proc = #{(0..10).map &2.method(:*).to_proc}"

if ::Object.method(:const_defined?).arity == 1
  def self.const_defined_in?(module, constant)
    module.const_defined?(constant)
    puts "ruby 1.8"
  end

else
  def self.const_defined_in?(module, constant)
    module.const_defined?(constant, false)
    puts "ruby 1.9"
  end

end







