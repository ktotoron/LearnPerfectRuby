Human = Struct.new(:age, :gender)
human = Human.new(10, 'male')
puts human.age
puts human.gender
puts human[:age]
puts Human.members


