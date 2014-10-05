
class KeywordArgs
  def nor_method_allow_kw_args(f_args, s_args, t_args)
    [f_args, s_args, t_args]
  end

  private

  def method_missing(name, *args)
    method_name = name.to_s + '_allow_kw_args'
    super unless respond_to? method_name

    args_hash = args.first

    # Method.parametersの戻り値を先頭から処理
    # _allow_kw_argsなしのメソッド呼び出し時に渡された引数を
    # _allow_kw_argsありのメソッド呼び出し時にマッチするようにする。
    new_args = self.method(method_name).parameters.map do |(req, arg_name)|
      args_hash[arg_name]
    end
    __send__ method_name, *new_args
  end
end

puts KeywordArgs.new.nor_method(t_args: 1, f_args: 2, s_args: 3)




