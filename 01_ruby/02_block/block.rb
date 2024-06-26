# 次の要件を満たすクラス、LearnBlockを作成してください　
#
# 1.
# 次の仕様を満たすメソッド `ext_sum` を作成してください
# 引数を2つと、その2つを `+` で結合した後の値を引数に取るブロックの3つを引数に取ります
# ただし、ブロックを渡さなくても動作します
# ブロックを受け取った場合、メソッドの戻り値はブロックの戻り値と等しい
# ブロックを受け取らなかった場合、メソッドの戻り値はブロックに渡す予定だった値と等しい
#
# 2.
# 次の仕様を満たすメソッド `search_unknown` を作成してください
# 引数を2つ受け取ります、1つ目の引数は必ず数値の配列です
# 1つ目の引数の中から、2つ目の引数を加えるとちょうど5の倍数になる数値だけを取り出して、新しい配列を作成し戻り値としてください
# ただし、LearnBlockクラスには、この仕様とは全く関係ないメソッド `unknown_number` メソッドが定義されていると仮定します(このメソッドは実装する必要はありません）
# 2つ目の引数を加える前に、必ずこの `unknown_number` の戻り値を、1つ目の引数の各数値に加えてから計算してください
# また、 `unknown_number` メソッドは、一度しか呼び出すことはできません
class LearnBlock
  def ext_sum(arg1, arg2, &blk)
    text = arg1 + arg2
    return text unless blk
    blk.call(text)
  end

  def search_unknown(ary, num)
    unum = unknown_number()
    ary.select do |n|
      ( n + unum + num ) % 5 == 0
    end
  end
end
