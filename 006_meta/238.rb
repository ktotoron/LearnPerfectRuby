# encoding=utf-8
class InstanceCount
  @@i_count = 0

  def self.instance_count
    @@i_count
  end

  def initialize
    @@i_count += 1
  end
end








