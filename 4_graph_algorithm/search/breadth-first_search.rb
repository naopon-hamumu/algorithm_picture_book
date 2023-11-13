# 幅優先探索
# 始点（最初にいる頂点）に近い頂点から、ゴール（指定された頂点）を探索する

def breadth_first_search(graph, start)
  queue = [start]
  visited = []

  until queue.empty?
    node = queue.shift
    next if visited.include?(node)

    visited << node
    neighbors = graph[node] - visited
    queue += neighbors
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

# 幅優先探索の実行
start_node = 'A'
result = breadth_first_search(graph, start_node)
puts "BFS starting from #{start_node}: #{result.join(', ')}"
