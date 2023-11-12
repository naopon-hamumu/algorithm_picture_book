# クイックソート
# ピボット（基準となる数）を数列の中からランダムに選び、
# ピボットより大きいか小さいかで分別し、ソートを行う

def quick_sort(array)
  return array if array.length <= 1

  # ピボット（基準値）を選択
  pivot = array.delete_at(rand(array.size))

  # ピボットより小さい要素と大きい要素を分割
  left, right = array.partition { |e| e < pivot }

  # 再起的にこれを繰り返し、最後に結合する
  quick_sort(left) + [pivot] + quick_sort(right)
end

# 使用例
array = [34, 7, 23, 32, 5, 62]
sorted_array = quick_sort(array)
puts sorted_array.to_s
