# encoding=utf-8
class InstanceCount
  @@c_count = 0
  @i_count = 0
  def self.class_count
    @@c_count
  end

  def self.instance_count
    @i_count
  end

  def self.instance_count_up
    @i_count += 1 if @i_count
  end

  def initialize
    @@c_count += 1
    self.class.instance_count_up
  end
end


class ChildInstanceCount < InstanceCount
end

puts "=================================================="
puts "InstanceCount.class_count = #{InstanceCount.class_count}"
puts "ChildInstanceCount.class_count = #{ChildInstanceCount.class_count}"
puts "InstanceCount.instance_count = #{InstanceCount.instance_count}"
puts "ChildInstanceCount.instance_count = #{ChildInstanceCount.instance_count}"

5.times do
  InstanceCount.new
end

puts "=================================================="
puts "InstanceCount.class_count = #{InstanceCount.class_count}"
puts "ChildInstanceCount.class_count = #{ChildInstanceCount.class_count}"
puts "InstanceCount.instance_count = #{InstanceCount.instance_count}"
puts "ChildInstanceCount.instance_count = #{ChildInstanceCount.instance_count}"

5.times do
  ChildInstanceCount.new
end

puts "=================================================="
puts "InstanceCount.class_count = #{InstanceCount.class_count}"
puts "ChildInstanceCount.class_count = #{ChildInstanceCount.class_count}"
puts "InstanceCount.instance_count = #{InstanceCount.instance_count}"
puts "ChildInstanceCount.instance_count = #{ChildInstanceCount.instance_count}"


