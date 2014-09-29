# 既知のオブジェクト以外のオブジェクトを表示
ObjectSpace.each_object(Class) {|c| p c}
puts "===================="
a = [4,4,2,3]
puts a.object_id
p ObjectSpace._id2ref(a.object_id)

o = Object.new
ObjectSpace.define_finalizer(o, proc{ puts 'finalizing...' })





