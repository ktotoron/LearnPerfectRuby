require 'socket'

Process.daemon

TCPServer.open 'localhost', 4423 do |server|
  loop do
    client = server.accept
    client.puts "Time.now = #{Time.now}\n"
    client.close
  end
end


