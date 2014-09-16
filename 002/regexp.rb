
pattern = /[0-9]+/

# マッチしたかどうか
puts pattern === 'HAL1234'
puts pattern === 'HAL_SPACE'

# マッチした位置
puts pattern =~ 'HAL1234'
puts pattern =~ 'HAL_SPACE'


name = 'alice'
pattern2 = /#{name}/
puts pattern2 =~ 'lice alice alice alice'


pattern3 = %r(/usr/bin)
puts pattern3 =~ '/root/usr/bin'

pwd = Dir.pwd
pattern4 = %r(#{pwd}/.+)
puts pwd




