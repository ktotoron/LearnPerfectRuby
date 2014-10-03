class Arity
  def a_0; end
  def a_1(x); end
  def a_2(x,y); end

  def a_variable_len(*x); end
  def a_variable_len_with_default(x, *y); end
  def a_default_val_1(x = 1); end
  def a_default_val_2(x, y = 1); end
  def a_block_val(x, &y); end
end

arity_obj = Arity.new
puts "arity_obj.method(:a_0).arity  = #{arity_obj.method(:a_0).arity}"
puts "arity_obj.method(:a_1).arity  = #{arity_obj.method(:a_1).arity}"
puts "arity_obj.method(:a_2).arity  = #{arity_obj.method(:a_2).arity}"

puts  "arity_obj.method( :a_variable_len).arity              =   #{arity_obj.method( :a_variable_len).arity}"
puts  "arity_obj.method( :a_variable_len_with_default).arity =   #{arity_obj.method( :a_variable_len_with_default).arity}"
puts  "arity_obj.method( :a_default_val_1).arity              =   #{arity_obj.method( :a_default_val_1).arity}"
puts  "arity_obj.method( :a_default_val_2).arity              =   #{arity_obj.method( :a_default_val_2).arity}"
puts "arity_obj.method(:a_block_val).arity = #{arity_obj.method(:a_block_val).arity}"

puts "===================================================================================================="


puts "arity_obj.method(:a_0                           ).parameters= #{arity_obj.method(:a_0                           ).parameters}"
puts "arity_obj.method(:a_1                           ).parameters= #{arity_obj.method(:a_1                           ).parameters}"
puts "arity_obj.method(:a_2                           ).parameters= #{arity_obj.method(:a_2                           ).parameters}"
puts "arity_obj.method(:a_variable_len                ).parameters= #{arity_obj.method(:a_variable_len                ).parameters}"
puts "arity_obj.method(:a_variable_len_with_default   ).parameters= #{arity_obj.method(:a_variable_len_with_default   ).parameters}"
puts "arity_obj.method(:a_default_val_1               ).parameters= #{arity_obj.method(:a_default_val_1               ).parameters}"
puts "arity_obj.method(:a_default_val_2               ).parameters= #{arity_obj.method(:a_default_val_2               ).parameters}"
puts "arity_obj.method(:a_block_val                   ).parameters= #{arity_obj.method(:a_block_val                   ).parameters}"

puts "===================================================================================================="

puts "Kernel.method(:puts) = #{Kernel.method(:puts)}"






