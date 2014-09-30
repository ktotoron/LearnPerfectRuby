obj = Object.new

puts "特異クラスが定義されるタイミング"
def obj.define_singleton_method
  :singleton_method
end

class << obj
end

obj.singleton_class

class OrgClass
end

obj = OrgClass.new
puts obj.singleton_class.superclass

puts "obj.instance_of? obj.singleton_class = #{obj.instance_of? obj.singleton_class}"
puts "obj.instance_of? OrgClass = #{obj.instance_of? OrgClass}"

