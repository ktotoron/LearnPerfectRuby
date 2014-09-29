for item in %w(foo bar baz)
  Thread.fork do
    sleep 1
    puts item
  end
end
# Threadの終了を待つ
(Thread.list - [Thread.current]).each &:join








