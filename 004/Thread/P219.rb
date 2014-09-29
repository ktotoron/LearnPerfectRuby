m1, m2 = Mutex.new, Mutex.new
t1 = Thread.fork {
  m1.lock
  sleep 1
  m2.lock
  sleep 1
}

t1.join

