require_relative 'l_l_node'

class LinkedList
  attr_accessor :head_node, :tail_node

  def initialize
    @head_node = nil
    @node = nil
    @tail_node = nil
  end

  def append(value)
    if !@head_node.nil? && @tail_node.nil?
      @tail_node = Node.new(value)
      @head_node.next_value = @tail_node
    elsif !@head_node.nil? && !@tail_node.nil?
      @node = @tail_node
      @tail_node = Node.new(value)
      @node.next_value = @tail_node
    end
    return unless @tail_node.nil?

    @head_node = Node.new(value)
  end

  def prepend_list(value)
    if !@head_node.nil? && @tail_node.nil?
      @tail_node = @head_node
      @head_node = Node.new(value, @tail_node)
    elsif !@tail_node.nil? && @head_node.nil?
      @head_node = Node.new(value, @tail_node)
    elsif !@tail_node.nil?
      @node = @head_node
      @head_node = Node.new(value, @node)
    end
    return unless @head_node.nil?

    @head_node = Node.new(value)
  end

  def size
    size = 0
    pointer = @head_node
    until pointer.nil?
      size += 1
      pointer = pointer.next_value
    end
    size
  end

  def head
    head_node.node_value
  end

  def tail
    tail_node.node_value
  end

  def at(index)
    pointer_index = 0
    pointer = @head_node
    until pointer_index == index
      pointer_index += 1
      pointer = pointer.next_value
    end
    pointer.value
  end

  def pop
    pointer = @head_node
    pointer = pointer.next_value until pointer.next_value == @tail_node
    pointer.next_value = nil
    @tail_node = pointer
  end

  def contains?(value)
    pointer = @head_node
    pointer = pointer.next_value until pointer.node_value == value || pointer.next_value.nil?
    if pointer.node_value == value
      true
    elsif pointer.next_value.nil?
      false
    end
  end

  def find(value)
    pointer_index = 0
    pointer = @head_node
    until pointer.node_value == value || pointer.next_value.nil?
      pointer_index += 1
      pointer = pointer.next_value
    end
    if pointer.node_value == value
      pointer_index
    elsif pointer.next_value.nil?
      nil
    end
  end

  def to_s
    string_list = ''
    pointer = @head_node
    until pointer.nil?
      string_list += "( #{pointer.node_value} ) -> "
      pointer = pointer.next_value
    end
    string_list + 'nil'
  end

  def insert_at(value, index)
    pointer_index = 1
    max = 1
    if index == 0
      @head_node = Node.new(value, @head_node)
      return
    end
    pointer = @head_node
    until pointer.next_value.nil?
      max += 1
      pointer = pointer.next_value
    end
    if index > max
      puts 'Error: nil cannot be in middle of list'
      nil
    else
      pointer = @head_node
      until pointer_index == index
        pointer_index += 1
        pointer = pointer.next_value
      end
      pointer.next_value = Node.new(value, pointer.next_value)
    end
  end

  def remove_at(index)
    pointer_index = 1
    max = 0
    if index == 0
      @head_node = @head_node.next_value
      return
    end
    pointer = @head_node
    until pointer.next_value.nil?
      max += 1
      pointer = pointer.next_value
    end
    if index > max
      puts 'Error: non-existent'
      nil
    else
      pointer = @head_node
      until pointer_index == index
        pointer_index += 1
        pointer = pointer.next_value
      end
      pointer.next_value = pointer.next_value.next_value
    end
  end
end
