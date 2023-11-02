# バブルソート
# 右から左に向かって、隣り合う2つの数字を比較して入れ替える

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  array
end

# 使用例
array = [4, 2, 5, 3, 1]
sorted_array = bubble_sort(array)
puts sorted_array.to_s
