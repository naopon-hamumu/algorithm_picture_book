# ヒープソート
# データ構造のヒープを利用することが特徴

def heap_sort(array)
  n = array.size

  # ヒープを構築
  (n / 2 - 1).downto(0) do |i|
    heapify(array, n, i)
  end

  # 1つずつ要素を取り出してヒープから削除
  (n - 1).downto(1) do |i|
    array[0], array[i] = array[i], array[0] # 最大値を配列の後ろに移動
    heapify(array, i, 0) # ヒープの再構築
  end

  array
end

def heapify(array, n, i)
  largest = i # 再建は根と仮定
  left = 2 * i + 1 # 左の子
  right = 2 * i + 2 # 右の子

  # 左の子が存在し、現在の最大値より大きいか確認
  largest = left if left < n && array[left] > array[largest]

  # 右の子が存在し、現在の最大値より大きいか確認
  largest = right if right < n && array[right] > array[largest]

  # 最大値が根ではない場合、交換する
  if largest != i
    array[i], array[largest] = array[largest], array[i]
    heapify(array, n, largest) # 交換した後のサブツリーに対してheapifyを再起的に呼び出す
  end
end

# 使用例
array = [12, 11, 13, 5, 6, 7]
sorted_array = heap_sort(array)
puts sorted_array.to_s
