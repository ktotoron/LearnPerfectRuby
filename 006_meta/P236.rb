class Klass
  puts self

  # Class Instance Variable
  @class_instance_val = :class_instance_val
  def self.class_instance_val
    @class_instance_val
  end
  
  @@class_val = :class_val

  def instance_method
    @@class_val
  end

end









