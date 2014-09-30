
SINGLETON_OBJ = Object.new

class << SINGLETON_OBJ
  def only_method
    :only_method
  end
end


SingletonClass = SINGLETON_OBJ.singleton_class

def SingletonClass.instance_get
  SINGLETON_OBJ
end




