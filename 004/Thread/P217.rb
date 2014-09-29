mutex = Mutex.new

def countup
  File.open 'ThreadCounter.txt', File::RDWR | File::CREAT do |f|
    last_count = f.read.to_i
    f.rewind
    f.write last_count + 1
  end
end


10.times.map {
  Thread.fork {
    mutex.synchronize { countup }
  }
}.map(&:join)

puts File.read('ThreadCounter.txt').to_i


