# encoding=utf-8

module ModuleTest
  def self.lot
    %w(b a c p).sample # Array#sampleはランダム抽出
  end

  module ChildModule
    def self.lot
      %w(x y z).sample
    end
  end
end

puts ModuleTest.lot
puts ModuleTest.lot

puts ModuleTest::ChildModule.lot


puts "==========Mix-in=========="

module Greetable
  def greet_to(name)
    puts "Hello, #{name}, Class name is #{self.class}."
  end

  def greet_to_override(name)
    puts "greet_to_override:: Hello, #{name}, Class name is #{self.class}."
  end
end


class Alice
  include Greetable

  def greet_to_override(name)
    super
    puts "Nice to meet you."
  end
end

alice = Alice.new
alice.greet_to 'Bob'
alice.greet_to_override 'Bob'


puts "==========Mix-in_FriendList=========="

class FriendList
  # mix-inは複数可能
  include Enumerable

  def initialize(*friends)
    @friends = friends
  end

  def each
    for v in @friends
      yield v
    end
  end

end

friend_list = FriendList.new('Alice', 'Bob', 'Charlie')

puts "friend_list.count :: #{friend_list.count}"
puts "friend_list.map{|v| v.upcase} :: #{friend_list.map{|v| v.upcase}}"
puts "friend_list.find{|v| /b/ === v} :: #{friend_list.find{|v| /b/ === v}}"

puts "==========Mix-in_include=========="

module ModuleA
  def from_a
    puts 'A'
  end
end

module ModuleB
  def from_b
    puts 'B'
  end
end

class MyClass
  include ModuleA
  include ModuleB
end

my_obj = MyClass.new
my_obj.from_a
my_obj.from_b


puts "==========Mix-in_module=========="
module ModuleC
  def from_c
    'C'
  end
end

module ModuleD
  include ModuleC
  def from_d
    'D'
  end
end

class Class_Mix_in
  include ModuleD
end

my_obj = Class_Mix_in.new
puts "my_obj.from_c :: #{my_obj.from_c}"
puts "my_obj.from_d :: #{my_obj.from_d}"

puts "==========include_method_extend=========="
module GreetableModule
  def greet_to(name)
    "Hello, #{name}, Class name is #{self.class}"
  end
end

obj = Object.new
obj.extend GreetableModule

puts "obj.greet_to 'World':: #{obj.greet_to 'World'}"

class Alice_extends
  extend GreetableModule
end

# class_methodのmix-in
alice = Alice_extends.new
puts "Alice_extends.greet_to 'Alice_extends' :: #{Alice_extends.greet_to 'Alice_extends'}"

puts "==========ModuleFunc=========="
puts "Math.sqrt(4) :: #{Math.sqrt(4)}"
include Math
puts "sqrt(9) :: #{sqrt(9)}"


module MyFunctions
  def my_module_func
    'Called'
  end
  module_function :my_module_func

  # module関数のの複数定義
  module_function
  def my_module_func_1
    'my_module_func_1'
  end

  def my_module_func_2
    'my_module_func_2'
  end
end

puts "MyFunctions.my_module_func :: #{MyFunctions.my_module_func}"
puts "MyFunctions.my_module_func_1 :: #{MyFunctions.my_module_func_1}"
puts "MyFunctions.my_module_func_2 :: #{MyFunctions.my_module_func_2}"

# autoload :Class, 'file_name'
# autoload :Module, 'file_name'

puts "==========NumericModule=========="
puts "0.zero? :: #{0.zero?}"
puts "0.nonzero? :: #{0.nonzero?}"

puts "555.integer? :: #{555.integer?}"
puts "3.6.integer? :: #{3.6.integer?}"
puts "3.real? :: #{3.real?}"
puts "Complex(1,2).real? :: #{Complex(1,2).real?}"

puts "10**2 = #{10**2}"
puts " 10/3 = #{ 10/3 }"
puts " 10.0/3 = #{ 10.0/3 }"
puts " 1<=>2 = #{ 1<=>2 }"
puts " 1<=>1 = #{ 1<=>1 }"
puts " 1<=>0 = #{ 1<=>0 }"


puts "==========round_Numeric=========="
puts "1.4.round = #{1.4.round}"
puts "1.5.round = #{1.5.round}"
puts "-1.5.round = #{-1.5.round}"

puts "1.4.ceil = #{1.4.ceil}"
puts "1.5.ceil = #{1.5.ceil}"
puts "-1.5.ceil = #{-1.5.ceil}"


puts "1.4.floor = #{1.4.floor}"
puts "1.5.floor = #{1.5.floor}"
puts "-1.5.floor = #{-1.5.floor}"
puts "-1.4.floor = #{-1.4.floor}"

puts "1.4.truncate = #{1.4.truncate}"
puts "-1.4.truncate = #{-1.4.truncate}"
puts "1.5.truncate = #{1.5.truncate}"
puts "-1.5.truncate = #{-1.5.truncate}"

puts "==========loop_numeric=========="

puts "=====3.step 5====="
3.step 5 do |num|
  print num, " "
end
puts ""

puts "=====1.2.step 2.0, 0.2====="
1.2.step 2.0, 0.2 do |num|
  print num, " "
end
puts ""

puts "100.class = #{100.class}"
puts "100000000000000000000000000000000.class = #{100000000000000000000000000000000.class}"

puts "succとnextは同じ"
puts "1.odd? = #{1.odd?}"
puts "1.even? = #{1.even?}"
puts "3.next = #{3.next}"
puts "3.succ = #{3.succ}"
puts "2.pred = #{2.pred}"

puts "==========numeric_convert=========="
puts "30.to_s = #{30.to_s}"
puts "30.to_s(2) = #{30.to_s(2)}"
puts "30.to_s(8) = #{30.to_s(8)}"
puts "30.to_s(16) = #{30.to_s(16)}"

puts "==========convert_character=========="
(65..70).map {|n| print n.chr, " "}
puts ""

begin 
  puts "256.chr = #{256.chr}"
rescue => e
  puts "25.chr :: #{e.class} :: #{e}"
end

puts "==========convert_nueric=========="
puts "'123'.to_i = #{'123'.to_i}"
puts "Time.now.to_i = #{Time.now.to_i}"

puts "Integer('4423')  = #{ Integer('4423') }"
puts "Integer('0xFF') = #{Integer('0xFF')}"
puts "Integer(3.14) = #{Integer(3.14)}"
begin
  puts "Integer(nil) = #{Integer(nil)}"
rescue => e
  puts "#{e.class}::#{e}"
end

begin
  puts "Integer('abc') = #{Integer('abc')}"
rescue => e
  puts "#{e.class}::#{e}"
end

puts "=====1.upto 3 do |num|====="
1.upto 3 do |num|
  print num, " "
end
puts ""

puts "=====3.downto 1 do |num|====="
3.downto 1 do |num|
  print num, " "
end
puts ""

puts "3.times do |num|"
3.times do |num|
  print num, " "
end
puts ""


puts "==========Float=========="
puts "1.0+1 = #{1.0 + 1}"
puts "1.0-1 = #{1.0 - 1}"
puts "2.0*1 = #{2.0 * 1}"
puts "20.0/3 = #{20.0 / 3}"
puts "20.0%3 = #{20.0 % 3}"
puts "10.0**3 = #{10.0 ** 3}"

puts "1.0/0 = #{1.0/0}"
puts "-1.0/0 = #{-1.0/0}"
puts "0.0/0 = #{0.0/0}"

puts "==========Rational(有理数)=========="
puts "Rational(1,3) = #{Rational(1,3)}"
puts "Rational(1,3).denominator = #{Rational(1,3).denominator}"
puts "Rational(1,3).numerator = #{Rational(1,3).numerator}"
puts "Rational(1,3).to_f = #{Rational(1,3).to_f}"
puts "3.quo(10)= 3/10 = #{3.quo(10)}"

puts "123.to_r = #{123.to_r}"
puts "Time.now.to_r = #{Time.now.to_r}"

puts "==========Complex(複素数)=========="
puts "Complex(2,3) = #{Complex(2,3)}"
puts "Complex(2,3).real = #{Complex(2,3).real}"
puts "Complex(2,3).imaginary = #{Complex(2,3).imaginary}"

puts "Complex(2) = #{Complex(2)}"
puts "Complex('2+2i') = #{Complex('2+2i')}"

puts "4423.to_c = #{4423.to_c}"
puts "1.5_to_c = #{1.5.to_c}"
puts "'2+2i'.to_c = #{'2+2i'.to_c}"

puts "==========String=========="

puts "'foobar'.empty? = #{'foobar'.empty?}"
puts "''.empty? = #{''.empty?}"
puts "'foobar'.length = #{'foobar'.length}"
puts "'foobar'.bytesize = #{'foobar'.bytesize}"
puts "'foobar'.include?('oo')= #{'foobar'.include?('oo')}"
# 指定した文字から始まるか
puts "'foobar'.start_with?('foo')= #{'foobar'.start_with?('foo')}"

puts "'Pine'+'apple' = #{'Pine'+'apple'}"
puts "'Hello'*3 = #{'Hello'*3}"
puts "'Result: %04d' % 42 = #{'Result: %04d' % 42}"
str = 'Pine'
puts "str = #{str}"
str << 'apple'
puts "str = #{str}"

str = 'abcde6fgh10ijklmnop'
puts "str.slice(4) = #{str.slice(4)}"
puts "str.slice(4,6) = #{str.slice(4,6)}"
puts "str.slice(4..6) = #{str.slice(4..6)}"
puts "str.slice(/[0-9]+/) = #{str.slice(/[0-9]+/)}"
puts "str.slice(-2, 2) = #{str.slice(-2, 2)}"

puts "==========cut_space=========="
str = " hi \t"
puts "str.strip = #{str.strip}"
puts "str.rstrip = #{str.rstrip}"
puts "str.lstrip = #{str.lstrip}"

puts "==========chomp=========="
puts "\"abcde\\n\\n\".chomp = #{"abcde\n\n".chomp}"
puts "\"abcde\".chop = #{"abcde".chop}"
puts "'woooooooooo'.squeeze = #{'woooooooooo'.squeeze}"
puts "'aabbccdd'.squeeze('abc') = #{'aabbccdd'.squeeze('abc')}"
puts "'aabbccdd'.squeeze('a-c') = #{'aabbccdd'.squeeze('a-c')}"
puts "'ABC'.downcase = #{'ABC'.downcase}"
puts "'abc'.upcase = #{'abc'.upcase}"
puts "'aBC'.swapcase = #{'aBC'.swapcase}"
puts "'tiTLE'.capitalize = #{'tiTLE'.capitalize}"

puts "'24-1-365'.sub(/[0-9]+/) = #{'24-1-365'.sub(/[0-9]+/, 'x')}"
puts "'24-1-365'.gsub(/[0-9]+/) = #{'24-1-365'.gsub(/[0-9]+/, 'x')}"
puts "'24-1-365'.gsub(/[0-9]+/){ |str| str.to_i.succ } = #{'24-1-365'.gsub(/[0-9]+/){ |str| str.to_i.succ }}"

# 変更がない場合はnilが返る
puts "変更がない場合はnilが返る"
str = " abcdefghijk "
puts "str = #{str}"
puts "str.strip! = #{str.strip!}"
puts "str = #{str}"
puts "str.strip! = #{str.strip!}"
puts "'dam'.reverse = #{'dam'.reverse}"

str = "Alice, Bob, Charlie"
puts "str = #{str}"
puts "str.split(',') = #{str.split(',')}"
puts "str.split(/,\s+/) = #{str.split(/,\s+/)}"
puts "str.split(/,\s+/, 2) = #{str.split(/,\s+/, 2)}"

puts "==========repeat_string=========="
'ABC'.each_char{|c| print "#{c}-" }
puts ""

puts "'あ'.each_byte do |byte|"
'あ'.each_byte do |byte|
  print byte, " "
end
puts ""

puts "\"Alice\\nBob\\nCharlie\".each_line do |line|"
"Alice\nBob\nCharlie".each_line do |line|
  puts line
end

puts "==========encoding=========="
puts "'てにおは',encoding = #{'てにおは'.encoding}"

str = 'こんにちは'
puts "str = #{str}"
puts "str.encoding = #{str.encoding}"
puts "str.encode!(Encoding::EUC_JP) = #{str.encode!(Encoding::EUC_JP)}"
puts "str.encoding = #{str.encoding}"

utf8 = 'こんにちは'.encode('UTF-8')
eucjp = 'こんにちは'.encode('EUC-JP')
puts "utf8 = #{utf8}"
puts "eucjp = #{eucjp}"

puts "utf8 == eucjp = #{utf8 == eucjp}"
puts "utf8.eql?(eucjp) = #{utf8.eql?(eucjp)}"

begin 
  puts "utf8+eucjp = #{utf8+eucjp}"
rescue => e
  puts "#{e.class} :: #{e}"
end

eucjp = 'Hello'.encode('EUC-JP')
utf8 = 'Hello'.encode('UTF-8')
utf16 = 'Hello'.encode('UTF-16')
ascii = 'Hello'.encode('ASCII-8BIT')

puts "utf8 == eucjp = #{utf8 == eucjp}"
puts "utf8 == ascii = #{utf8 == ascii}"
puts "utf8 == utf16 = #{utf8 == utf16}"


puts "utf8 + eucjp = #{utf8 + eucjp}"
puts "utf8 + ascii = #{utf8 + ascii}"
begin
  puts "utf8 + utf16= #{utf8 + utf16}"
rescue => e
  puts "#{e.class} :: #{e}"
end

puts "==========Regexp=========="
puts "/[0-9]/ === 'ruby' = #{/[0-9]/ === 'ruby'}"
puts "/[0-9]/ === 'ruby5' = #{/[0-9]/ === 'ruby5'}"

puts "/[0-9]/ =~ 'ruby' = #{/[0-9]/ =~ 'ruby'}"
puts "/[0-9]/ =~ 'ruby5' = #{/[0-9]/ =~ 'ruby5'}"

def alice?(pattern)
  pattern === 'alice'
end

puts "alice?(/Alice/i) = #{alice?(/Alice/i)}"
puts "alice?('alice') = #{alice?('alice')}"

str = 'ruby5'
if matched = /[0-9]/.match(str)
  p matched
end

puts "==========RegexpMatchObject=========="
/(ab).+(ba)/ =~ '[abbbbbb,ba!]'
match = Regexp.last_match
p match
p "match.pre_match = #{match.pre_match}"
puts "match[0] = #{match[0]}"
puts "match[1] = #{match[1]}"
puts "match[2] = #{match[2]}"
puts "match[-1] = #{match[-1]}"
puts "match.post_match = #{match.post_match}"

str = 'Yamazaki Nozaki'
puts "str = #{str}"
str.scan(/w+zaki/)
puts "str.scan(/\w+zaki/) = #{str.scan(/\w+zaki/)}"
puts "str.scan(/(\w+)zaki/) = #{str.scan(/(\w+)zaki/)}"

puts "str.scan(/\w+zaki/){|s| puts s.upcase}"
str.scan(/\w+zaki/){|s| puts s.upcase}
puts "str.scan(/(\w+)zaki/){|s| puts s[0].upcase}"
str.scan(/(\w+)zaki/){|s| puts s[0].upcase}


puts "==========RegexpEscape=========="
part = Regexp.escape('(incomplete)')
puts "Regexp.escape('(incomplete)') = #{Regexp.escape('(incomplete)')}"
print '/[|.]+#{part}\.txt/', ' = '
puts "/[|.]+#{part}\.txt/"

puts "==========CharacterClass=========="

puts "==========Grouping_and_BackwordReference=========="
/(B) to \1/ === 'B to B'
puts "/(B) to \1/ === 'B to B' = #{/(B) to \1/ === 'B to B'}"
puts "$1 = #{$1}"
puts "/(?<number>[0-9]+)/ === 'abc-123' = #{/(?<number>[0-9]+)/ === 'abc-123'}"
puts "Regexp.last_match[:number] = #{Regexp.last_match[:number]}"

pattern = /\d{3}-\d{4}-\d{4}/
puts "pattern = #{pattern}"
puts "pattern === '080-1234-5678'} = #{pattern === '080-1234-5678'}"
puts "pattern === '03-1234-5678'} = #{pattern === '03-1234-5678'}"

pattern = /(?<num>[0-9]+)[a-c\-]+\k<num>/
puts "pattern = #{pattern}"
puts "pattern === '123-abc-123' = #{pattern === '123-abc-123'}"

puts "==========部分式呼び出し=========="
phone = '080-1234-5678'
pattern = /([0-9]+)-\g<1>-\g<1>/
puts "pattern = #{pattern}"
puts "pattern === phone = #{pattern === phone}"

puts "==========後方参照=========="
pattern = /([0-9]+)-\1-\1/
puts "pattern = #{pattern}"
puts "pattern === phone = #{pattern === phone}"

puts "==========ラベル=========="
pattern = /(?<num>[0-9]+)-\g<num>-\g<num>/
puts "pattern = #{pattern}"
puts "pattern === phone = #{pattern === phone}"


puts "==========先読みと後読み=========="
pattern = /(?<=丁目)(\d+)(?=番地)/
address = '東京都港区六本木6丁目10番地'

puts "pattern = #{pattern}"
puts "address = #{address}"
p pattern.match(address)


puts "2012年にはマッチしない"
pattern = /(?<!2012)-(?<month_and_day>\d{2}-\d{2})/
puts "pattern = #{pattern}"
puts "pattern.match('2012-01-01') = #{pattern.match('2012-01-01')}"
puts "pattern.match('2013-01-01') = #{pattern.match('2013-01-01')}"


puts "==========バックトラック禁止(最低限のサーチ)=========="
pattern = /(\w+)/
puts "pattern = #{pattern}"
puts "pattern.match('ruby')[1] = #{pattern.match('ruby')[1]}"
puts "pattern.match('ruby5')[1] = #{pattern.match('ruby5')[1]}"

pattern = /(\w+)[0-9]/
puts "pattern = #{pattern}"
puts "pattern.match('ruby') = #{pattern.match('ruby')}"
puts "pattern.match('ruby5') = #{pattern.match('ruby5')}"


pattern = /(?>\w+)[0-9]/
puts "pattern = #{pattern}"
puts "pattern.match('ruby') = #{pattern.match('ruby')}"
puts "pattern.match('ruby5') = #{pattern.match('ruby5')}"

puts "==========Regexp=========="
puts '/ruby/mi == %r{ruby}mi'
pattern = /ruby/mi
puts "pattern = #{pattern}"
pattern = %r{ruby}mi
puts "pattern = #{pattern}"


puts "==========RegexpOption=========="
pattern = /R(?i)uby(?-i)/
puts "pattern === 'ruby' = #{pattern === 'ruby'}"
puts "pattern === 'Ruby' = #{pattern === 'Ruby'}"
puts "pattern === 'RUBY' = #{pattern === 'RUBY'}"

puts "==========Comparable=========="
class Ruler
  include Comparable

  attr_accessor :length

  def initialize(len)
    self.length = len
  end

  def <=>(other)
    length <=> other.length
  end
end

short = Ruler.new(30)
long = Ruler.new(100)

puts "short < long = #{short < long}"
puts "short > long = #{short > long}"
puts "short <= long = #{short <= long}"
puts "short >= long = #{short >= long}"
puts "short == long = #{short == long}"
puts "short != long = #{short != long}"

puts "<=>の場合は"
puts "a<b = -1"
puts "a==b = 0"
puts "a>b = 1"


puts "==========Enumerable=========="
puts "%w(Alice Bob Charlie).each_with_index do |name, index|"
%w(Alice Bob Charlie).each_with_index do |name, index|
  puts "#{index} : #{name}"
end

puts "(1..3).reverse_each do |val|"
(1..3).reverse_each do |val|
  print val, " "
end

puts "(1..5).each_slice 2 do |a, b|"
(1..5).each_slice 2 do |a, b|
  p [a, b]
end

puts "(1..4).each_cons 2 do |a, b|"
(1..4).each_cons 2 do |a, b|
  p [a, b]
end

# succメソッドがないのはエラーになる
puts "(0.0..1.0).each_ do |f|"
begin
  (0.0..1.0).each_ do |f|
    print f, " "
  end
rescue => e
  puts "#{e.class}::#{e}"
end

puts "引数なしだと無限loop"
puts "(1..3).cycle(2) do |n|"
(1..3).cycle(2) do |n|
  print n, " "
end


puts ""
puts "p ['ruby', 'rails'].map {|str| str.upcase}"
p ['ruby', 'rails'].map {|str| str.upcase}

puts "==========map=========="
puts "[true, true, true].all? = #{[true, true, true].all?}"
puts "[false, true, true].all? = #{[false, true, true].all?}"

puts "[false, false, false].none? = #{[false, false, false].none?}"
puts "[true, true, false].any? = #{[true, true, false].any?}"
puts "[false, false, false].any? = #{[false, false, false].any?}"
puts "[true, false, false].one? = #{[true, false, false].one?}"

print '[4, 4, 2, 3].all? {|v| v.is_a?(Integer)} = '
puts "#{[4, 4, 2, 3].all? {|v| v.is_a?(Integer)}}"
print '[4, 4, \'two\', 3].all? {|v| v.is_a?(Integer)} = '
puts "#{[4, 4, 'two', 3].all? {|v| v.is_a?(Integer)}}"

puts "%w(Alice Bob Charlie).grep(/a/i) = #{%w(Alice Bob Charlie).grep(/a/i)}"
puts "['a', 'b', 3, 4].grep(String) = #{['a', 'b', 3, 4].grep(String)}"
puts ""
puts "Object.new.methods.grep(/\?/) = #{Object.new.methods.grep(/\?/)}"
puts ""

puts "[4,4,2,3].detect{|v|v.even?}} = #{[4,4,2,3].detect{|v|v.even?}}"
puts "[4,4,2,3].select{|v|v.even?}} = #{[4,4,2,3].select{|v|v.even?}}"
puts "[4,4,2,3].reject{|v|v.even?}} = #{[4,4,2,3].reject{|v|v.even?}}"

puts "[1,2,3,4,5].take(3) = #{[1,2,3,4,5].take(3)}"
puts "[1,2,3,4,5].drop(3) = #{[1,2,3,4,5].drop(3)}"

array = [1,2,3,4,5]

puts "array = #{array}"
puts "array.take_while {|n| n < 3} = #{array.take_while {|n| n < 3}}"
puts "array.drop_while{|n| n < 3} = #{array.drop_while{|n| n < 3}}"

puts "[4,4,2,3].inject(0) {|result, num| = #{[4,4,2,3].inject(0) {|result, num| result + num }}"
# シンボルを渡す
puts "シンボルを渡す"
puts "[4,4,2,3].inject(:+) = #{[4,4,2,3].inject(:+)}"

# resultは引き継ぐ
hash = %w(Alice Bob Charlie).each_with_object({}) {|name, result| result[name] = name.length }
puts "%w(Alice Bob Charlie).each_with_object({}) {|name, result| result[name] = name.length } = #{hash}"

# 要素のグルーピング
array = [1, 2.0, 3, 4.0, 5]
puts "ハッシュで分割"
puts "array = #{array}"
puts "array.group_by {|v| v.class} = #{array.group_by {|v| v.class}}"

array = [1,2,3,4,5]
puts "配列で分割"
puts "array = #{array}"
puts "array.partition{|v| v.even?} = #{array.partition{|v| v.even?}}"

puts "==========Range=========="
range = (1..10)
puts "range = #{range}"
puts "range.max = #{range.max}"
puts "range.min= #{range.min}"
puts "range.minmax = #{range.minmax}"


people = %w(Alice Bob Charlie)
puts "people = #{people}"
puts "people.min_by {|s| s.length} = #{people.min_by {|s| s.length}}"
puts "people.max_by {|s| s.length} = #{people.max_by {|s| s.length}}"
puts "people.minmax_by {|s| s.length} = #{people.minmax_by {|s| s.length}}"

people = %w(Bob Alice Charlie)
puts "people.sort = #{people.sort}"
puts "people.sort {|a, b| a.length <=> b.length} = #{people.sort {|a, b| a.length <=> b.length}}"
puts "people.sort_by {|a| a.length} = #{people.sort_by {|a| a.length}}"

puts "==========Array=========="
puts "Array.new(5,1) = #{Array.new(5,1)}"

array = Array.new(5, 'naive')
puts "array = #{array}"

puts "array[0].reverse! = #{array[0].reverse!}"
puts "array = #{array}"

array = Array.new(3) {|i| i.succ}
puts "array = Array.new(3) {|i| i.succ}"
puts "array = #{array}"

puts "Array('Alice') = #{Array('Alice')}"
puts "Array([Alice]) = #{Array([Alice])}"
puts "Array#to_a = self"

puts "array.include?(2) = #{array.include?(2)}"
puts "[1,2,3]+[4,5] = #{[1,2,3]+[4,5]}"
puts "[4,4,2,3] - [4,3] = #{[4,4,2,3] - [4,3]}"
puts "[1,2,3] & [2,3,4] = #{[1,2,3] & [2,3,4]}"
puts "[1,2,3]*2 = #{[1,2,3]*2}"

array = [1,2,3,4,5]
puts "array = #{array}"
puts "array[2] = #{array[2]}"
# 開始位置
# 長さ
puts "array[2,2] = #{array[2,2]}"
puts "array[0..2] = #{array[0..2]}"
puts "array.values_at(1) = #{array.values_at(1)}"
puts "array.values_at(1,3) = #{array.values_at(1,3)}"
puts "array.first = #{array.first}"
puts "先頭から2個取得"
puts "array.first(2) = #{array.first(2)}"
puts "array.last = #{array.last}"
puts "array.last(2) = #{array.last(2)}"

puts "=====Random====="
puts "array.sample = #{array.sample}"
puts "array.sample(2) = #{array.sample(2)}"


puts "==========Array=========="
ary = [ [:foo,4], [:bar, 2], [:bazz,3] ]
puts "ary = #{ary}"
puts "ary.assoc(:bar) = #{ary.assoc(:bar)}"

array = [1,2,3,4,5]
puts "array = #{array}"
puts "array[10] = 100 = #{array[10] = 100}"
puts "array = #{array}"

puts "array << 11 = #{array << 11}"
puts "array = #{array}"
puts "array.push 12 = #{array.push 12}"
puts "array = #{array}"
puts "array.pop = #{array.pop}"
puts "array = #{array}"

puts "array.unshift 0 = #{array.unshift 0}"
puts "array = #{array}"
puts "array.shift = #{array.shift}"
puts "array = #{array}"

puts ""
puts "select!, reject!は変更がない場合はnilを返す"
array = [1,2,3,4,5]
puts "array = #{array}"
puts "array.select! {|v| v.even?} = #{array.select! {|v| v.even?}}"

array = [1,2,3,4,5]
puts "array = #{array}"
puts "array.reject! {|v| v.even?} = #{array.reject! {|v| v.even?}}"

puts ""
puts "delete_if, keep_ifは値を返す"
array = [1,2,3,4,5]
puts "array = #{array}"
puts "array.delete_if {|v| false}} = #{array.delete_if {|v| false}}"
puts "array.keep_if{|v| true}} = #{array.keep_if{|v| true}}"

puts ""
array = [1,2.0,3,2,5]
puts "array = #{array}"
puts "array.delete 2 = #{array.delete 2}"
puts "array = #{array}"

puts ""
array = [1,2.0,3,2,5]
puts "array = #{array}"
puts "array.delete_at 3 = #{array.delete_at 3}"
puts "array = #{array}"

puts ""
array = [1,2,nil,4,5,nil,nil,9]
puts "array = #{array}"
puts "array.compact = #{array.compact}"

puts ""
array = [1,1,2,2,3,3,4,5,6,3,8,9]
puts "array = #{array}"
puts "array.uniq = #{array.uniq}"

puts ""
array = [1,1,2,2,3,3,4,5,6,3,8,9]
puts "array = #{array}"
puts "array.reverse = #{array.reverse}"

puts ""
array = [[1,1],[2,2],3,3,4,5,6,[7,8,9]]
puts "array = #{array}"
puts "array.flatten = #{array.flatten}"

puts ""
array = [10,111,223,24,3,3,4,5,6,3,8,9]
puts "array = #{array}"
puts "array.sort = #{array.sort}"

puts ""
array = ['fo', 'foooooo', 'foo']
puts "array = #{array}"
puts "array.sort_by {|v| v.length} = #{array.sort_by {|v| v.length}}"

puts ""
people = %w(Alice Bob Charlie)
puts "people.map {|p| p.upcase} = #{people.map {|p| p.upcase}}"

puts
array = [['a','b','c'], [1,2,3]]
puts "array = #{array}"
puts "2次元配列でない場合はTypeError"
puts "要素数が違う場合はIndexError"
puts "array.transpose = #{array.transpose}"

puts
array = [1, 'a']
puts "array = #{array}"
puts "array.zip([2,'b'], [3, 'c']) = #{array.zip([2,'b'], [3, 'c'])}"

puts "==========BinarySearch=========="
array = [1,3,5,7,9]
puts "array = #{array}"
puts "array.bsearch {|n| n > 6} = #{array.bsearch {|n| n > 6}}"
puts "array.bsearch {|n| n > 10} = #{array.bsearch {|n| n > 10}}"
puts "array.join('-') = #{array.join('-')}"

puts 
puts "==========Hash=========="
puts "array = #{array}"
puts "array.hash = #{array.hash}"
puts "array.reverse.hash = #{array.reverse.hash}"

hash = {one: 1, two: 2}
puts "hash = #{hash}"

puts "hash.each do |k, v|"
hash.each do |k, v|
  puts "#{k}::#{v}"
end

puts "hash.each_key do |k|"
hash.each_key do |k|
  print "#{k},"
end
puts

puts "hash.each_value do |v|"
hash.each_value do |v|
  print "#{v},"
end
puts 

puts
hash = {}
puts "hash[:foo] = 'bar' = #{hash[:foo] = 'bar'}"
puts "hash = #{hash}"
puts "hash.delete(:foo) = #{hash.delete(:foo)}"

puts
hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
puts "hash.select {|k, v| v.odd?} = #{hash.select {|k, v| v.odd?}}"
puts "hash.reject {|k, v| v.odd?} = #{hash.reject {|k, v| v.odd?}}"

puts
puts "==trueのとき残す"
hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
puts "hash = #{hash}"
puts "hash.keep_if {|k, v| v.odd?} = #{hash.keep_if {|k, v| v.odd?}}"

puts "==trueのとき消す"
hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
puts "hash = #{hash}"
puts "hash.delete_if {|k, v| v.odd?} = #{hash.delete_if {|k, v| v.odd?}}"

puts
puts "==========HashMerge=========="
hash_a = {one: 1, two: 21}
hash_b = {three: 3, two: 22}
puts "hash_a = #{hash_a}"
puts "hash_b = #{hash_b}"
puts "hash_a.merge(hash_b) = #{hash_a.merge(hash_b)}"

def keywords(hash = {})
  defaults = {alice: 'a', bob: 'b'}
  hash = defaults.merge(hash)
  hash
end

puts "keywords({alice: 'Alice'}) = #{keywords({alice: 'Alice'})}"
puts "{one: 1, two: 2}.invert = #{{one: 1, two: 2}.invert}"
puts "どちらか消える"
puts "{one: 1, two: 1}.invert = #{{one: 1, two: 1}.invert}"

puts
hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
puts "hash = #{hash}"
puts "Key_Exist"
puts "hash.has_key?(:one) = #{hash.has_key?(:one)}"
puts "hash.key?(:one) = #{hash.key?(:one)}"
puts "hash.member?(:one) = #{hash.member?(:one)}"
puts "hash.include?(:one) = #{hash.include?(:one)}"
puts
puts "Value_Exist"
puts "hash.has_value?(2) = #{hash.has_value?(2)}"
puts "hash.value?(2) = #{hash.value?(2)}"

puts
puts "hash.key(3) = #{hash.key(3)}"
puts "hash.keys = #{hash.keys}"
puts "hash.values = #{hash.values}"
puts "hash.values_at(:three, :one) = #{hash.values_at(:three, :one)}"

three, two = hash.values_at(:three, :two)
puts "three = #{three}, two = #{two}"

puts "==========default_value=========="
puts 'has_default = Hash.new(\'undefined\')'
has_default = Hash.new('undefined')
puts "has_default['foo'] = #{has_default['foo']}"
puts "has_default['foo'].reverse! = #{has_default['foo'].reverse!}"
puts "has_default['oo'] = #{has_default['oo']}"
puts

puts "===== BlockArgment ====="
counter = 0
puts "Time.nowでもOK"
has_default = Hash.new {|hash, key| counter += 1 }
puts "has_default[:foo] = #{has_default[:foo]}"
puts "has_default[:foo] = #{has_default[:foo]}"

puts
puts "has_default = {} = #{has_default = {}}"
puts "has_default['foo'] = #{has_default['foo']}"
has_default.default = 'bar'
puts "has_default['foo'] = #{has_default['foo']}"

puts
puts "set:default_proc"
puts 'has_default.default_proc = ->(hash, key) {Time.now}'
has_default.default_proc = ->(hash, key) {Time.now}
puts "has_default['foo'] = #{has_default['foo']}"

puts "==========hash_fetch=========="
hash_fetch = {}
puts hash_fetch.fetch('foo', 'default')
puts hash_fetch.fetch('foo') {|key| key}
begin
  puts hash_fetch.fetch('foo')
rescue => e
  puts "#{e.class}::#{e}"
end


puts "==========hash_to_array=========="
a = {one: 1, two: 2}.to_a
puts "{one: 1, two: 2}.to_a = #{{one: 1, two: 2}.to_a}"
puts "a.assoc(:one) = #{a.assoc(:one)}"
array = ['A', 1, 'B', 2] 
puts "array = #{array}"
puts "Hash[*array] = #{Hash[*array]}"

puts
array = [['C', 3], ['D', 4]]
puts "array = #{array}"
puts "Hash[*array] = #{Hash[*array]}"


puts "==========Enumerator=========="
puts "return EnumaratorObject"
puts "[].each                        =  #{ [].each}"
puts "{}.each                        =  #{ {}.each}"
puts "(1..10).each                   =  #{ (1..10).each}"
puts "''.each_char                   =  #{ ''.each_char}"
puts "10.times                       =  #{ 10.times}"
puts "loop                           =  #{ loop}"
puts "[1,2,3].to_enum                =  #{[1,2,3].to_enum}"
puts "'Alice'.enum_for(:each_char)   =  #{'Alice'.enum_for(:each_char)}"

lines = <<EOM
Alice
Bob
Charlie
EOM
puts "<lines>\n#{lines}</lines>"
enum = lines.each_line
puts "enum.map {|l| l.length } = #{enum.map {|l| l.length }}"

%w(Alice Bob Charlie).each.with_index do |name, index|
  print "{#{index}::#{name}} "
end

puts '%w(Alice Bob Charlie).select.with_index {|name, index| index > 1}'
puts "#{%w(Alice Bob Charlie).select.with_index {|name, index| index > 1}}"
enum = [4, 1, 2, 3].to_enum
puts "enum = #{enum}"
print "enum.map {|d| d} = #{enum.map {|d| d}}"
puts
puts "==enum.next=="
puts "enum.next = #{enum.next}"
puts "enum.next = #{enum.next}"
puts "enum.rewind = #{enum.rewind}"
puts "enum.next = #{enum.next}"

puts
puts "==loop=="
loop do
  print enum.next, " "
end

puts
puts "=====loop_is_catch_StopIteration====="
people = %w(Alice Bob Charlie).to_enum
age = [1, 4].to_enum
loop do
  puts "#{people.next} (#{age.next})"
end

enum = %w(Alice Bob Charlie).select
# /li/ match
puts "==========match_/li/=========="
loop do
  begin
    ps = enum.next
    enum.feed /li/ === ps # blockの戻り値になる
  rescue StopIteration => e
    # 返却値
    p e.result
    break
  end
end

puts "==========Enumerator::Lazy(遅延評価)=========="
puts "すべての要素をなめなくてはいけないので時間がかかる"
puts '(0..Float::INFINITY).map {|n| n.succ}.select {|n| n.odd?}.take(3)'
puts

puts '(0..Float::INFINITY).lazy.map {|n| n.succ}.select {|n| n.odd?}.take(3)'
odd_numbers = (0..Float::INFINITY).lazy.map {|n| n.succ}.select {|n| n.odd?}.take(3)
puts "odd_numbers.force = #{odd_numbers.force}"

puts "<Check_Lazy>"
(0..Float::INFINITY).lazy.map {|n|
  puts "lazy.map #{n}"
  n.succ
}.select {|n|
  puts "select #{n}"
  n.odd?
}.take(3).force
puts "</Check_Lazy>"


puts
puts "==========Time=========="
puts "Time.now = #{Time.now}"
puts "Time.now.zone = #{Time.now.zone}"
puts "Time.now.getutc= #{Time.now.getutc}"
now = Time.now
puts "now = #{now}"
puts "now.to_i = #{now.to_i}"
puts "now.to_f = #{now.to_f}"
puts "now.to_r = #{now.to_r}"
puts "now.to_s = #{now.to_s}"

puts
puts "now.year       #{now.year}"
puts "now.month      #{now.month}"
puts "now.day        #{now.day}"
puts "now.hour       #{now.hour}"
puts "now.min        #{now.min}"
puts "now.sec        #{now.sec}"
puts "now.nsec       #{now.nsec}"
puts "now.wday       #{now.wday}"
puts '1月1日=1'
puts "now.yday       #{now.yday}"

puts
puts "==========CompareTime=========="
a = Time.now
b = Time.now
puts "a = #{a}"
puts "b = #{b}"
puts "a == b = #{a == b}"
puts "a.nsec = #{a.nsec}"
puts "b.nsec = #{b.nsec}"

puts
puts " a<=>b       =    #{a<=>b   }"
puts " a < b       =    #{a < b   }"
puts " a <= b      =    #{a <= b  }"
puts " a > b       =    #{a > b   }"
puts " a >= b      =    #{a >= b  }"
puts " b - a       =    #{b - a   }"
puts " b + 1       =    #{b + 1   }"

puts "==========TimeObject=========="
puts "Time.at(0) = #{Time.at(0)}"
puts "Time.at(0).getutc = #{Time.at(0).getutc}"
puts "Time.at(-10000000000).getutc = #{Time.at(-10000000000)}"
puts "Time.at(+10000000000).getutc = #{Time.at(+10000000000)}"
puts "Time.utc(2011, 4, 1, 5, 30, 20, 100) = #{Time.utc(2011, 4, 1, 5, 30, 20, 100)}"
puts "Time.utc(2011) = #{Time.utc(2011)}"
puts "Time.local(2011, 4, 1, 5, 30, 20, 100) = #{Time.local(2011, 4, 1, 5, 30, 20, 100)}"
puts "Time.local(2011) = #{Time.local(2011)}"

args = Time.now.to_a
puts "Time.now.to_a = #{Time.now.to_a}"
puts "Time.utc(*args) = #{Time.utc(*args)}"
puts "Time.local(*args) = #{Time.local(*args)}"

puts "==========Time_String=========="
puts "Time.now.strftime('%Y/%m/%d %H:%M:%S') = #{Time.now.strftime('%Y/%m/%d %H:%M:%S')}"






# %w(Alice Bob Charlie)
# %w(Alice Bob Charlie)



