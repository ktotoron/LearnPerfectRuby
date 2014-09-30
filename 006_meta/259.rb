module PrependModule
  def prepend_method
    :prepend_method
  end
end

class PrependClass
  prepend PrependModule
end

pobj = PrependClass.new
puts pobj.prepend_method


puts "==========prependはincludeよりも優先=========="

