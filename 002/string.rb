
str = <<EOS
1
2
3
4
EOS

# 式展開、バックスラッシュ記法無視
str_quote = <<'EOS'
1
2
\t\n
#{str}
EOS

puts "#{str}"
puts "#{str_quote}"


symbol_var1 = "Symbol"
symbol_var2 = "Symbol"
puts ":Symbol::#{:Symbol}"
puts ":symbol_var1::#{:symbol_var1}"

puts "symbol_var1"
puts ".object_id::#{symbol_var1.object_id}"
puts ".intern::#{symbol_var1.intern}"
puts ".intern.object_id::#{symbol_var1.intern.object_id}"

puts "symbol_var2"
puts ".object_id::#{symbol_var2.object_id}"
puts ".intern::#{symbol_var2.intern}"
puts ".intern.object_id::#{symbol_var2.intern.object_id}"




