# 戻り値は最後に評価された値
greeter = Proc.new {|name|
  "Hello, #{name.capitalize}"
}

puts greeter.call('alice')

