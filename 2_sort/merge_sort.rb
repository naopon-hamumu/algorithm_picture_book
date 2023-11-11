# マージソート
# ソートしたい数列を分裂、統合する手法

def merge_sort(array)
  # ベースケース：配列の長さが1以下の場合は、そのまま返す
  return array if array.length <= 1

  # 配列を分割する中間点を決定
  mid = array.length / 2

  # 再起的にサブ配列をソート
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  # ソート済みのサブ配列をマージ
  merge(left, right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    # 左右の配列の先頭を比較して、小さい方を取り出しsortedに追加
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  # 残った要素を追加（左右いずれかの配列は空のはず）
  sorted.concat(left).concat(right)
end

array = [38, 27, 43, 3, 9, 82, 10]
sorted_array = merge_sort(array)
puts sorted_array.to_s
