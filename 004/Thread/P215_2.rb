t = Thread.fork {
  begin
    loop do
    end
  rescue => e
    puts 'resureing...'
  end
}
# 例外発生
t.raise

sleep 1

# 以上終了の場合nil
p t.status


