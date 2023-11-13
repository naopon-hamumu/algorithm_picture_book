# ダイクストラ法
# グラフの最短路問題を解くために、間を通る辺のコストの総和が最も小さいものを求める

def dijkstra(graph, source)
  distances = Hash.new(Float::INFINITY)
  distances[source] = 0
  pq = [source]
  visited = {}

  until pq.empty?
    current_node = pq.min_by { |node| distances[node] }
    pq.delete(current_node)
    visited[current_node] = true

    graph[current_node].each do |neighbor, weight|
      next if visited[neighbor]

      new_distance = distances[current_node] + weight
      if new_distance < distances[neighbor]
        distances[neighbor] = new_distance
        pq.push(neighbor) unless pq.include?(neighbor)
      end
    end
  end

  distances
end

# グラフの定義（ノードとエッジ）
graph = {
  'A' => {'B' => 6, 'D' => 1},
  'B' => {'A' => 6, 'D' => 2, 'E' => 2},
  'C' => {'B' => 5, 'E' => 5},
  'D' => {'A' => 1, 'B' => 2, 'E' => 1},
  'E' => {'B' => 2, 'C' => 5, 'D' => 1}
}

# ダイクストラ法の実行
source = 'A'
distances = dijkstra(graph, source)
puts "Distances from #{source}"
distances.each { |node, distance| puts " #{node}: #{distance}" }
