# Reflection

class HaveInstanceVal
  def initialize
    @foo = 1
    @bar = 2
  end
end

h_inst_val = HaveInstanceVal.new

puts "h_inst_val = #{h_inst_val.instance_variables}"
puts h_inst_val.instance_variables.any? {|v| v =~ /fo/}
puts h_inst_val.instance_variables.select {|v| v =~ /fo/}
puts "h_inst_val.instance_variable_defined? :@foo  = #{h_inst_val.instance_variable_defined? :@foo }" 
puts "h_inst_val.instance_variable_defined? :@buzz = #{h_inst_val.instance_variable_defined? :@buzz}"  
begin 
  puts "h_inst_val.instance_variable_defined? :foo  = #{h_inst_val.instance_variable_defined? :foo }" 
rescue => e
  puts "#{e.class}:#{e}"
end

puts "===================================================================================================="
puts

puts "h_inst_val.instance_variable_get :@foo  = #{h_inst_val.instance_variable_get :@foo}"  
puts "h_inst_val.instance_variable_get :@buzz = #{h_inst_val.instance_variable_get :@buzz}"  
begin 
  puts "h_inst_val.instance_variable_get :foo  = #{h_inst_val.instance_variable_get :foo }" 
rescue => e
  puts "#{e.class}:#{e}"
end

puts "===================================================================================================="
puts

puts "h_inst_val.instance_variable_set :@foo, 2  = #{h_inst_val.instance_variable_set :@foo, 2}"  
puts "h_inst_val.instance_variable_get :@foo  = #{h_inst_val.instance_variable_get :@foo}"  


puts "===================================================================================================="
puts

puts "h_inst_val.instance_variable_defined? :@buzz = #{h_inst_val.instance_variable_defined? :@buzz}"  
puts "h_inst_val.instance_variable_set :@buzz, 256  = #{h_inst_val.instance_variable_set :@buzz, 256}"  
puts "h_inst_val.instance_variable_get :@buzz  = #{h_inst_val.instance_variable_get :@buzz}"  
puts "h_inst_val.instance_variable_defined? :@buzz = #{h_inst_val.instance_variable_defined? :@buzz}"  







