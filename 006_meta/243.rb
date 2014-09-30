module UnIncModule
  def un_inc_mod_method
    :un_inc_mod_method
  end
end

class Klass
  define_method :un_inc_mod_method, UnIncModule.instance_method(:un_inc_mod_method)
end

obj = Klass.new
puts "obj.un_inc_mod_method = #{obj.un_inc_mod_method}"


module FIncMod
  def same_name_method
    :f_inc_mod
  end
end


module SIncMod
  def same_name_method
    :s_inc_mod
  end
end

class KlassIncFandS
  include FIncMod
  include SIncMod
end

obj = KlassIncFandS.new
puts "obj.same_name_method = #{obj.same_name_method}"

puts "==========Override=========="

class KlassIncFandS
  define_method :same_name_method, FIncMod.instance_method(:same_name_method)
end

obj = KlassIncFandS.new
puts "obj.same_name_method = #{obj.same_name_method}"




