# 線形探索
# 配列の前から順番にデータを探索する

def linear_search(array, value)
  array.each_with_index do |element, index|
    return index if element == value
  end

  nil
end

# 使用例
array = [5, 3, 2, 1, 4]
value_to_find = 1
found_index = linear_search(array, value_to_find)

if found_index
  puts "値 #{value_to_find} はインデックス #{found_index} で見つかりました。"
else
  puts "値 #{value_to_find} は配列内に存在しません。"
end
