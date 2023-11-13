# 幅優先探索
# 始点（最初にいる頂点）に近い頂点から、ゴール（指定された頂点）を探索する

def breadth_first_search(graph, start_node)
  queue = [start_node]
  visited = { start_node => true }

  while queue.any?
    current = queue.shift
    puts "訪問：#{current}"
    graph[current].each do |neighbor|
      next if visited[neighbor]
      queue << neighbor
      visited[neighbor] = true
    end
  end
end

# グラフの例
graph = {
  'A' => ['B', 'C'],
  'B' => ['A', 'D', 'E'],
  'C' => ['A', 'F'],
  'D' => ['B'],
  'E' => ['B', 'F'],
  'F' => ['C', 'E']
}

# 幅優先探索の実行
breadth_first_search(graph, 'A')
