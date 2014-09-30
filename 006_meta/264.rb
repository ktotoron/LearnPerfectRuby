puts "==========モジュール内に閉じたオープンクラス"

module RefineMod
  refine String do
    def hello
      puts "#{self}, hello"
    end
  end
end

using RefineMod

'Bob'.hello

