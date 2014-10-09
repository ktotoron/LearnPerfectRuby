require "pry"

module DebuggerSample
  def self.cond_print(obj, cond)
    if cond
      p obj
    end
  end
end

binding.pry
DebuggerSample.cond_print([1, 2, 3], true)

