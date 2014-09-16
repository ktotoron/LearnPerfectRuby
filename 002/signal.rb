
# 第一引数に割り込むsignal(:INT)
# 第二引数にブロック・文字列
trap :INT do
  puts "\nInterrupted!"
  exit;
end

trap :EXIT do
  puts "Finalizing\n"
end

loop do
  sleep 1
  puts "Running...\n"
end


