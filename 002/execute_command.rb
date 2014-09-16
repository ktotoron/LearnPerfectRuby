puts "==========system_uname=========="
# 結果が返る
uname = `uname`
puts "#{uname}"


puts "==========spawn=========="
# 非同期実行(ProcessIDが返還される)
pid = spawn('uname')
# pid番のプロセスが終了するまで待つ
Process.waitpid pid
# pidの出力
puts "process_id = #{pid}"



puts "==========ENV=========="
ENV['HOGE'] = 'huga'
echo_system = `echo $HOGE`
puts "#{echo_system}"


# system/exec/spawnは第一引数にハッシュの指定が可能
pid = spawn({'HOGE' => 'piyo'}, 'echo $HOGE');
Process.waitpid pid

puts "==========parameter=========="
puts "echo `pwd`', chdir: '/tmp"
# systemの後ろに属性・振る舞いの付加
system('echo `pwd`', chdir: '/tmp');
# コマンドの実行後ステータス$?に代入されている
puts "command_status: #{$?}"

puts "==========exec=========="
puts "execは実行後プロセスが乗っ取られる"








