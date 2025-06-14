class Node
  attr_accessor :node_value, :next_value

  def initialize(node_value = nil, next_value = nil)
    @node_value = node_value
    @next_value = next_value
  end
end
