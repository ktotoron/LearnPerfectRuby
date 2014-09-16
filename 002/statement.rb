#encoding=utf-8

# nil false以外はtrue
n = 2
p n.zero?
p n.even?
p n.odd?

puts "==========if=========="
if n.zero?
  puts 'zero'
elsif n.even?
  puts 'even'
elsif n.odd?
  puts 'odd'
end

platform =
  if /darwin/ =~ RUBY_PLATFORM
    'Mac'
  else
    'Others'
  end
puts "platform = #{platform}"

puts "if_before" if (true)

puts "==========unless=========="
unless n.zero?
  puts "zero"
else
  puts "!zero"
end

puts "==========case=========="
stone = 'ruby'
case stone
when 'ruby'
  puts '7'
when 'peridot', 'sardonyx'
  puts '8'
else
  puts '?'
end

case stone
when /ruby/
  puts '7'
when /peridot|sardonyx/
  puts '8'
else
  puts '?'
end

detected = 
  case stone
  when /ruby/
    '7'
  when /peridot|sardonyx/
    '8'
  else
    '?'
  end
puts "detected = #{detected}"

detected = 
  case stone
  when /ruby/ then '7'
  when /peridot|sardonyx/ then '8'
  else '?'
  end
puts "detected = #{detected}"

detected = 
  case stone
  when stone == 'ruby' then '7'
  when stone == 'peridot' || stone == 'sardonyx' then '8'
  else '?'
  end
puts "detected = #{detected}"

puts "==========while=========="
languages = %w(Perl Python Ruby)
i = 0
while i < languages.length
  puts "Hello, #{languages[i]}"
  i += 1
end

i = -1
puts "Hello, #{languages[i]}" while languages[i+=1] != nil

i = 0
begin
  puts "Hello, #{languages[i]}"
  i += 1
end while i < languages.length

puts "==========until=========="
i = languages.length - 1
until i < 0
  puts "Hello, #{languages[i]}"
  i -= 1
end

i = languages.length
puts "Hello, #{languages[i]}" until (i-=1) < 0

i = languages.length - 1
begin
  puts "Hello, #{languages[i]}"
  i -= 1
end until i < 0

puts "==========for=========="
for name in %w(Alice Bob Carol)
  puts name
end

for val in {a: 1, b: 2}
  puts val[0]
  puts val[1]
end

for k, v in {a: 3, b: 4}
  puts k
  puts v
end

puts "==========loop=========="
loop do
  puts "infinity loop"
  break
end

puts "==========times=========="
2.times do
  puts "Hello"
end

puts "==========break=========="
loop_break_value = loop do
  puts "infinity loop"
  break "break_value"
end

puts loop_break_value

puts "==========next=========="
languages.each do |lg|
  next unless lg == 'Ruby'
  puts 'Ruby'
end

puts "==========redo=========="
languages.each do |lg|
  puts lg
  if (lg == 'Python')
    lg = 'PP'
    redo
  end
end

puts "==========exception=========="
begin 
  raise 'error!' # RuntimeError(文字列はRuntimeError)
rescue => e
  puts "{e.class} : #{e.class}"
  puts "{e.message} : #{e.message}"
  puts "{e.backtrace} : #{e.backtrace}"
end

puts "StandardError"

begin 
  raise StandardError, 'error!' # StandardError: Error
rescue => e
  puts "{e.class} : #{e.class}"
  puts "{e.message} : #{e.message}"
  puts "{e.backtrace} : #{e.backtrace}"
ensure 
  # finally
  puts "ensure == finally"
end

begin 
  raise StandardError, 'error!' # StandardError: Error
rescue Exception => e
  puts "{e.class} : #{e.class}"
  puts "{e.message} : #{e.message}"
  puts "{e.backtrace} : #{e.backtrace}"
end

begin 
  raise StandardError, 'error!' # StandardError: Error
rescue Exception, StandardError => e
  puts "{e.class} : #{e.class}"
  puts "{e.message} : #{e.message}"
  puts "{e.backtrace} : #{e.backtrace}"
end


begin
  begin
    raise StandardError, 'st_error'
  rescue StandardError => e
    puts "catch_1"
    puts e.message
    #再スロー
    raise
  end
rescue Exception => e
  puts "catch_2"
  puts e.message
end

begin
  puts "else"
rescue e
else
  puts "else_error_is_not_occurred"
end

#Catch  ZeroDivisionError
1 / 0 rescue false


error_returned_val =
  begin
    1 / 0
  rescue
    "ZeroDivisionError_is_occurred"
  else
    "ZeroDivisionError_is_not_occurred"
  ensure
    "NotReturnedValue"
  end

puts "error_returned_val: #{error_returned_val}"

def method_exception
  puts "method_exception::main"
rescue
  puts "method_exception::rescue"
else
  puts "method_exception::else"
ensure
  puts "method_exception::ensure"
end

puts "==========method_exception=========="
method_exception

puts "==========class_define_exception=========="
class Whatever
  # 処理
rescue
  # 定義時に例外が発生した場合の処理
else
  # 定義時に例外が発生しなかった場合の処理
ensure
  # 例外の有無に関わらずに実行される処理
end


puts "==========retry_exception=========="
failed = 0
begin
  failed ||= 0
  puts 'trying...'

  puts 1 / failed

  puts 'try_end'
rescue
  failed += 1
  retry if failed < 5
end


puts "==========大域脱出=========="
catch :triple_loop do
  loop do
    puts "one"
    loop do
      puts "two"
      loop do
        puts "three"
        throw :triple_loop
      end
    end
  end
end

catch :entire do
  catch :process do
    throw :entire #entireブロックの中断
  end
end

catch_return = catch(:foo) {
  # catchの第二引数は戻り値
  throw :foo, 'returned_value'
}
puts catch_return

puts "==========method_call=========="
# 戻り値ありは()
# rvar = method(var)
# なしは()なし
# method var
def call_func
  'called'
end

puts call_func


puts "==========func=========="
def func_arg_test(name, msg = 'Hi')
  "#{msg}, #{name}"
end
puts func_arg_test('Alice')
puts func_arg_test('Alice', "Hello")
puts func_arg_test('Alice', nil)

def func_var_arg_test(name, *msgs)
  res = []
  msgs.each do |msg|
    res.push "#{msg}, #{name}"
  end
  res
end
puts func_var_arg_test("Alice", 'Hi', 'Hello', 'GoodMorning')

f_array = ["A", "B", "C"]
puts func_var_arg_test("Alice", *f_array)


puts "==========block=========="
%w(Alice Bob Camel).each do |name|
  puts "Hello, #{name}"
end

def block_sample_func
  puts "UP"
  yield
  puts "DOWN"
end

block_sample_func do end

block_sample_func do
  puts "Block"
end

File.open 'blockfile.txt', 'w' do |file|
  file.puts 'File.Write'
  file.puts 'File.Write'
end

def disp_val_func
  puts yield
end

disp_val_func do
  "disp_var"
end

disp_val_func do
  next 42
end

val = disp_val_func do
  break 44
end
puts "val = #{val}"


def with_ctime
  yield Time.now
end

with_ctime do |now|
  puts now.year
end

with_ctime do 
  puts "Hi"
end

with_ctime do |now, some|
  puts some.inspect
end


# ブロック引数のデフォルト値
def def_arg_for_block
  yield
end

def_arg_for_block do |val = 'Hi'|
  puts val
end

# ブロックの引数に
# 可変の引数を受け取る
def flex_arg_for_block
  yield 1, 2, 3
end
flex_arg_for_block do |*params|
  puts params.inspect
end

# 仮引数としてブロックを受け取る
def block_sample(&block)
  puts 'UP'
  block.call if block
  puts 'DOWN'
end

block_sample do
  puts 'walk'
end

puts "========== block_object =========="
peoples = %w(Alice Bob Charlie)
block = Proc.new {|name| puts name}
peoples.each &block

p1 = Proc.new {|val| val.upcase}
p2 = :upcase.to_proc
puts p1.call('hi')
puts p2.call('hi')

puts peoples.map { |person| person.upcase }
# &が頭につくとto_procが自動で呼ばれる
# map(&:method_name)
puts peoples.map(&:upcase)


def write_with_lock
  File.open 'time.txt', 'w' do |f|
    f.flock File::LOCK_EX
    yield f
    f.flock File::LOCK_UN
  end
end

write_with_lock do |f|
  f.puts Time.now
end

puts "==========Upcase=========="
# 手続きはdo..end
# 戻り値ありの場合は{..}
# method1(arg, method2){..}
people = []
%w(Alice Bob Camel).each do |name|
  people << name.upcase #末尾に追加
end
puts people

# keyword
puts "==========keywords_args=========="
def provisional_keywords_args(hash = {})
  puts "#{hash}"
end

provisional_keywords_args key1: 'value1', key2: 'value2' 

def provisional_keywords_args_default(hash = {})
  default = {alice: 'Alice', bob: 'Bob'}
  hash = default.merge(hash)
  hash
end

puts provisional_keywords_args_default(bob: 'BOB')
puts provisional_keywords_args_default(alice: 'ALICE')

# ruby2.0< keyword_args
# alice, bobのみ指定
def keywords_args(alice: nil, bob: nil)
  {alice: alice, bob: bob}
end
puts keywords_args alice: 'Alice', bob: 'Bob'

# 存在しないものはoptionsとして渡される
# オプションのhash
def keywords_args_with_options(alice: nil, bob: nil, **options)
  {alice: alice, bob: bob, options: options}
end
# 順番変更もあり
puts keywords_args_with_options charlie: 'CHARLIE', dog: 'DOG', alice: 'ALICE', bob: 'BOB'

str =<<EOF
# 仮引数の順序
# １.通常／省略可能な引数
# ２.*で指定可能な可変長引数
# ３.キーワード引数
# ４.**で指定可能なhashの引数
# ５.&で指定可能なブロックの引数
EOF
puts str

puts "==========::call_func=========="
puts Time::now

puts "==========method_undefine=========="
def undef_test1
  'undef_test1'
end
def undef_test2
  'undef_test2'
end

undef undef_test1, undef_test2

def undef_test1
  'undef_test1_2'
end
puts undef_test1


puts "==========alias_method=========="
# 別名を付ける(タグを貼付ける)
alias greet puts
greet 'hi'
undef greet
puts 'hi'


puts "==========break=========="
puts "==========break=========="
puts "==========break=========="


























__END__
