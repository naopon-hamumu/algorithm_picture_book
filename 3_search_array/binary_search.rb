# 2分探索
# 配列の真ん中あたりのデータと目的のデータを比較し、左右のどちらにあるか絞る

def binary_search(array, value)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (low + high) / 2
    guess = array[mid]

    if guess == value
      return mid
    elsif guess > value
      high = mid - 1
    else
      low = mid + 1
    end
  end

  nil # 値が見つからない場合
end

# 使用例
array = [1, 3, 5, 7, 9, 11, 13, 15]
value_to_find = 9
found_index = binary_search(array, value_to_find)

if found_index
  puts "値 #{value_to_find} はインデックス #{found_index} で見つかりました。"
else
  puts "値 #{value_to_find} は配列内に存在しません。"
end
