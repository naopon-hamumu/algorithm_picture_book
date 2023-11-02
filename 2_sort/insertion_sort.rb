# 挿入ソート
# 数列の左側から順番にソートしていくイメージ

def insertion_sort(array)
  (1...array.length).each do |i|
    key = array[i]
    j = i - 1

    # keyより大きい要素を一つずつ後ろへ移動する
    while j >= 0 && array[j] > key
      array[j + 1] = array[j]
      j -= 1
    end

    # より小さい要素の後ろにkeyを挿入する
    array[j + 1] = key
  end

  array
end

# 使用例
array = [12, 11, 13, 5, 6]
sorted_array = insertion_sort(array)
puts sorted_array.to_s
