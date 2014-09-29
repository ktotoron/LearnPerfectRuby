# encoding=utf-8

puts "==========IO_FILE=========="
file = File.open('IO.rb')
puts file.read
file.close

File.open 'IO.rb' do |file|
  puts file.read
end

File.open 'IO.rb' do |file|
  while line = file.gets
    puts line
  end
end

File.open 'IO.rb' do |file|
  file.each_line do |line|
    puts line
  end
end

puts File.read('IO.rb')

File.open 'fname.txt', 'w' do |f|
  f.write 'Hello'
end

File.open 'fname.txt', File::WRONLY | File::CREAT do |f|
  f.puts 'puts'
  f.puts
  f.print 'print'
  f.printf "%03d", 7
  f.putc 97
end

File.write 'greeting.txt', 'greeting'

File.open 'fname.txt', 'a+' do |f|
  f.puts 'add_string'
  f.rewind
  puts f.read
  f.seek 10
  f.seek -10, IO::SEEK_CUR
  # 末尾から-10
  f.seek -10, IO::SEEK_END
  # 絶対位置
  f.pos = 30
  # encoding
  f.set_encoding('UTF-8')
  # 外部エンコーディング(EUC-JP)から内部エンコーディング(UTF-8)に指定
  f.set_encoding('EUC-JP', 'UTF-8')
  # 上に同じ
  f.set_encoding('EUC-JP:UTF-8')
end

# エンコーディングの指定をして開く
File.open 'fname.txt', 'r:euc-jp:utf-8' do |f|
  puts "f.external_encoding = #{f.external_encoding}"
  puts "f.internal_encoding = #{f.internal_encoding}"
end

puts "==========FileLock=========="
# flockはアドバイザリロック(flockを使うプロセス同士でしかアクセスを防げない)
File.open 'counter.txt', File::RDWR | File::CREAT do |f|
  f.flock File::LOCK_EX
  count = f.read.to_i
  f.rewind
  f.write count.succ
end

puts
puts "==========FileSpec=========="
File.open 'counter.txt' do |f|
  puts "f.atime = ", f.atime
  puts "f.ctime = ", f.ctime
  puts "f.mtime = ", f.mtime
  puts "f.size  = ",  f.size
end

puts
puts "==========FileStat=========="
stat = File.open('counter.txt', &:stat)

puts  "stat.ftype         =   #{stat.ftype}"
puts  "stat.file?         =   #{stat.file?}"
puts  "stat.directory?    =   #{stat.directory?}"
puts  "stat.symlink?      =   #{stat.symlink?}"
puts  "stat.pipe?         =   #{stat.pipe?}"
puts  "stat.socket?       =   #{stat.socket?}"

puts  "stat.writable?     =   #{stat.writable?}"
puts  "stat.readable?     =   #{stat.readable?}"
puts  "stat.executable?   =   #{stat.executable?}"
puts  "stat.owned?        =   #{stat.owned?}"
puts  "stat.gid           =   #{stat.gid}"
puts  "stat.uid           =   #{stat.uid}"
puts  "stat.ino           =   #{stat.ino}"
puts  "stat.dev           =   #{stat.dev}"


puts "==========FileControle=========="
#
# リネーム
# File.rename 'src', 'dest'
#
# 移動
# File.rename 'src', 'dir/dest'
# 
# 削除
# File.unlink 'fname'
#
# シンボリックリンク
# File.symlink 'org', 'sym'
#
# ハードリンク
# File.link 'org', 'link'
# 
# modeの変更
# File.chmod 0600, 'fname'

puts
puts "==========FileGetStatus=========="
fname = '/etc/hosts'

puts "File.atime(fname)       =   #{File.atime(fname)}"
puts "File.ctime(fname)       =   #{File.ctime(fname)}"
puts "File.mtime(fname)       =   #{File.mtime(fname)}"
puts "File.exists?(fname)     =   #{File.exists?(fname)}"
puts "File.owned?(fname)      =   #{File.owned?(fname)}"
puts "File.executable?(fname) =   #{File.executable?(fname)}"
puts "File.readable?(fname)   =   #{File.readable?(fname)}"
puts "File.writable?(fname)   =   #{File.writable?(fname)}"
puts "File.ftype(fname)       =   #{File.ftype(fname)}"
puts "File.file?(fname)       =   #{File.file?(fname)}"
puts "File.directory?(fname)  =   #{File.directory?(fname)}"
puts "File.pipe?(fname)       =   #{File.pipe?(fname)}"
puts "File.socket?(fname)     =   #{File.socket?(fname)}"
puts "File.symlink?(fname)    =   #{File.symlink?(fname)}"
puts "File.size(fname)        =   #{File.size(fname)}"
puts "File.zero?(fname)       =   #{File.zero?(fname)}"
puts "File.stat(fname)        =   #{File.stat(fname)}"

puts "==========ControllFilePath=========="
fname = '/etc/resolv.conf'

puts "File.dirname(fname)                  =  #{File.dirname(fname)}"
puts "File.basename(fname)                 =  #{File.basename(fname)}"
puts "File.basename(fname, '.*')           =  #{File.basename(fname, '.*')}"
puts "File.extname(fname)                  =  #{File.extname(fname)}"
puts "File.join('/usr/local', 'bin/ruby')  =  #{File.join('/usr/local', 'bin/ruby')}"
puts "File.split('/usr/local/bin/ruby')    =  #{File.split('/usr/local/bin/ruby')}"

puts "File.expand_path('fname', '/path/to/there')    =   #{File.expand_path('fname', '/path/to/there')}"
puts "File.expand_path('fname')                      =   #{File.expand_path('fname')}"
puts "File.expand_path('..', __FILE__)               =   #{File.expand_path('..', __FILE__)}"
puts "展開する"
puts "File.expand_path('~')                          =   #{File.expand_path('~')}"
puts "展開しない"
puts "File.absolute_path('~')                        =   #{File.absolute_path('~')}"
puts "シンボリックリンクのリアルパス"
puts "File.realpath"
puts 

puts "==========Kernel#open=========="
open('fname.txt') {|f| puts f.read }
open('|uname -a') {|io| puts io.read }
open '|-', 'w' do |io|
  if io
    puts "ParentProcessではブロック引数がIOオブジェクト"
    io.puts 'Hello, world!'
  else
    puts "ChildProcessではブロック引数がnil"
    puts gets
  end
end

puts
puts "==========Dir=========="
puts "Dir.pwd = #{Dir.pwd}"
puts "Dir.home = #{Dir.home}"
puts "Dir.chdir('/tmp') = #{Dir.chdir('/tmp')}"
puts "Dir.pwd = #{Dir.pwd}"
Dir.chdir('/tmp') do |path|
  puts path
  puts Dir.pwd
end

puts "==========FileList=========="
puts Dir.entries('/usr')
puts "=====open"
Dir.open '/usr' do |dir|
  puts dir.entries
end

puts
puts "=====Glob"
puts "Dir.glob('/usr/lib*')        #{Dir.glob('/usr/lib*')}"
puts "Dir['/usr/lib*']             #{Dir['/usr/lib*']}"
puts "Dir['/etc/*.{hd,db}']        #{Dir['/etc/*.{hd,db}']}"
puts "Dir['*']                     #{Dir['*']}"
puts "Dir.glob('./**/*.pmg')       #{Dir.glob('./**/*.pmg')}"

puts
puts
puts "==========Thread=========="
Dir.chdir(__dir__)
file = %w(tags class.rb)
threads = file.map {|file|
  Thread.fork {
    num = File.readlines(file).length
    "#{file}: #{num}"
  }
}

puts "threads.map(&:value) = #{threads.map(&:value)}"
puts "Thread.main = #{Thread.main}"
puts "Thread.current = #{Thread.current}"
puts "Thread.list = #{Thread.list}"



