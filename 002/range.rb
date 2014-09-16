# 5を含むかふくまないか
puts (1..5).include?(5)   # true
puts (1...5).include?(5)  # false


vacation = Time.at(1343000000)..Time.at(1353000000)
puts vacation.begin
puts vacation.end


abc = ('a'..'c')

abc.each do |c|
  puts c
end



