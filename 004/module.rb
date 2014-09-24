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

array = [1,2,3,4,5]
puts "array = #{array}"
puts "array.values_at(1) = #{array.values_at(1)}"
puts "array.values_at(1,3) = #{array.values_at(1,3)}"
puts "array.first = #{array.first}"
puts "先頭から2個取得"
puts "array.first(2) = #{array.first(2)}"
puts "array.last = #{array.last}"
puts "array.last(2) = #{array.last(2)}"












#puts "#{}"









































