# ベルマン-フォード法
# グラフの最短路問題を解くアルゴリズム
# 辺重み付きグラフに始点と終点が指定されている

def bellman_ford(graph, source)
  distance = {}
  graph.keys.each { |node| distance[node] = Float::INFINITY }
  distance[source] = 0

  (graph.keys.size - 1).times do
    graph.each do |node, edges|
      edges.each do |edge|
        if distance[node] + edge[:weight] < distance[edge[:to]]
          distance[edge[:to]] = distance[node] + edge[:weight]
        end
      end
    end
  end

  # 検出負の重みのサイクル
  graph.each do |node, edges|
    edges.each do |edge|
      if distance[node] + edge[:weight] < distance[edge[:to]]
        raise "Graph contains a negative-weight cycle"
      end
    end
  end

  distance
end

# グラフの定義（ノードとエッジ）
graph = {
  'A' => [{to: 'B', weight: 6}, {to: 'D', weight: 1}],
  'B' => [{to: 'E', weight: 2}],
  'C' => [{to: 'B', weight: 4}],
  'D' => [{to: 'C', weight: 2}, {to: 'E', weight: 1}],
  'E' =>[]
}

# ベルマンフォード法の実行
source = 'A'
distances = bellman_ford(graph, source)
puts "Distances from #{source}:"
distances.each { |node, distance| puts " #{node}: #{distance}"}
