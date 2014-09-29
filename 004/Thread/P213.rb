for item in %w(a b c)
  Thread.fork item do |value|
    sleep 1
    puts value
  end
end

(Thread.list - [Thread.current]).each &:join

