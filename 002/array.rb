# encoding=utf-8

array = ['Alice', 4423, 3.14, nil, false]

puts array
puts "array[0] = #{array[0]}"

puts "array[10 = 'Frank'"
# 途中はnilになる
array[10] = 'Frank'
puts array

puts "%記法(Perlのqwみたいなもの)"
puts "空白は\でエスケープ"
puts %w(0 str #{array[10]})
puts %w(0 str\ #{array[10]})
puts %W(0 str #{array[10]})
puts %W(0 str\ #{array[10]})
