# 深さ優先探索
# 視点からゴールに辿り着くまで、1つずつ路を深く掘り下げながら探索をする

def depth_first_search(graph, start)
  stack = [start]
  visited = []

  while stack.any?
    node = stack.pop
    next if visited.include?(node)

    visited << node
    neighbors = graph[node] - visited
    stack += neighbors
  end

  visited
end

# グラフの定義
graph = {
  'A' => ['B', 'C'],
  'B' => ['A', 'D', 'E'],
  'C' => ['A', 'F'],
  'D' => ['B'],
  'E' => ['B', 'F'],
  'F' => ['C', 'E']
}

# 深さ優先探索の実行
start_node = 'A'
result = depth_first_search(graph, start_node)
puts "DFS starting from #{start_node} : #{result.join(', ')}"
