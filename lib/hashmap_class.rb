require_relative 'linked_list_class/l_l_class'
require_relative 'linked_list_class/l_l_node'

class HashMap
  attr_reader :length_of_map
  attr_accessor :buckets, :capacity, :length_of_map

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(16, nil)
    @length_of_map = 0
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
      
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
   @buckets = @buckets + Array.new(@capacity, nil) 
   if @length_of_map > @load_factor * @capacity
     @buckets = @buckets + Array.new(@capacity, nil)
     @capacity *= 2
   end
   hash_code = hash_code % @capacity
  end

  def set(key, value)
    hash_code = hash(key)
    bucket = @buckets[hash_code]
    if bucket == nil
      @buckets.delete_at(hash_code)
      @buckets.insert(hash_code, LinkedList.new)
      bucket = @buckets[hash_code]
      bucket.append({key => value})
      @length_of_map += 1
    else
      if self.has?(key) == true
        pointer = bucket.head_node
        hash = pointer.node_value
        until hash.key?(key) == true
          pointer = pointer.next_value
          return if pointer == nil
          hash = pointer.node_value
        end
        hash[key] = value
        return
      end
      @length_of_map += 1
      bucket.append({key => value})
    end
  end

  def get(key)
    hash_code = hash(key)
    bucket = @buckets[hash_code]
    return nil if bucket == nil
    pointer = bucket.head_node
    hash = pointer.node_value
    until hash.key?(key) == true
      pointer = pointer.next_value
      return if pointer == nil
      hash = pointer.node_value
    end
    return hash[key]
  end

  def has?(key)
    hash_code = hash(key)
    bucket = @buckets[hash_code]
    if bucket != nil
    pointer = bucket.head_node
    value = pointer.node_value
      until value.key?(key) == true
        pointer = pointer.next_value
        return if pointer == nil
        value = pointer.node_value
      end
      if pointer.node_value.key?(key) == true
        return true
      else
        return false
      end
    end
  end

  def remove(key)
    hash_code = hash(key)
    bucket = @buckets[hash_code]
    return nil if bucket == nil
    pointer = bucket.head_node
    hash = pointer.node_value
    list_index = 0
    until hash.key?(key) == true
      pointer = pointer.next_value
      return if pointer == nil
      list_index += 1
      hash = pointer.node_value
    end
    bucket.remove_at(list_index)
  end

  def length
    return self.length_of_map
  end

  def clear
    self.buckets = Array.new(16, nil)
    self.capacity = 16
    self.length_of_map = 0
  end

  def keys
    keys_array = []
    @buckets.each do |bucket|
      if bucket != nil
        pointer = bucket.head_node
        hash = pointer.node_value
        (bucket.size).times do
          transformed_hash = hash.to_a.flatten
          keys_array.push(transformed_hash[0])
          pointer = pointer.next_value
          hash = pointer.node_value if pointer != nil
        end
      end
    end
    return keys_array
  end

  def values
    keys_array = []
    @buckets.each do |bucket|
      if bucket != nil
        pointer = bucket.head_node
        hash = pointer.node_value
        (bucket.size).times do
          transformed_hash = hash.to_a.flatten
          keys_array.push(transformed_hash[1])
          pointer = pointer.next_value
          hash = pointer.node_value if pointer != nil
        end
      end
    end
    return keys_array
  end

  def entries
    array = []
    @buckets.each do |bucket|
      if bucket != nil
        pointer = bucket.head_node
        hash = pointer.node_value
        (bucket.size).times do
          transformed_hash = hash.to_a
          array.push(transformed_hash[0])
          pointer = pointer.next_value
          hash = pointer.node_value if pointer != nil
        end
      end
    end
    return array
  end
end