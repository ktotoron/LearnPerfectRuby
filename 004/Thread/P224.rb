pid = Process.fork {
  sleep 1
}

puts (Process.waitpid pid)




