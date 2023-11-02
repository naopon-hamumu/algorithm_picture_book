# 選択ソート
# 数列の中から最小値を検索し、左端の数字と入れ替える

def selection_sort(array)
  n = array.length

  for i in 0...n
    min_index = i
    for j in (i + 1)...n
      min_index = j if array[j] < array[min_index]
    end

    array[i], array[min_index] = array[min_index], array[i] if min_index != i
  end

  array
end

# 使用例
array = [64, 25, 12, 22, 11]
sorted_array = selection_sort(array)
puts sorted_array.to_s
