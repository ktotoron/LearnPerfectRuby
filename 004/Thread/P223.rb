pid = Process.fork {
  puts 'From child process'
}

pid = Process.fork

if pid
  puts "forked: #{$$}"
else
  puts "From child process #{$$}"
end

