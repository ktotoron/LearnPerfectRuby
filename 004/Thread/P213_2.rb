thread = Thread.fork {
  Thread.current[:status] = "Thread.current = #{Thread.current}"
}

(Thread.list - [Thread.current]).each &:join
puts thread[:status]


