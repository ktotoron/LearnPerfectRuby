# encoding=utf-8
class Klass
  def self.class_method1
    :class_method1
  end

  def Klass.class_method2
    :class_method2
  end

  def (p self).class_method4
    :class_method4
  end

end


def Klass.class_method3
  :class_method3
end

puts "Klass.class_method1 = #{Klass.class_method1}"
puts "Klass.class_method2 = #{Klass.class_method2}"
puts "Klass.class_method3 = #{Klass.class_method3}"


