class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail 
  end

  def get(key)
  end

  def include?(key)
    
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_node = @tail.prev
    new_node.next = @tail
    new_node.prev = prev_node
    @tail.prev = new_node
    prev_node.next = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    big_head = first
    until big_head == @tail 
      yield(big_head)
      big_head = big_head.next
    end
  end
    # result = []
    # @head.each do |node|
    #   result << node.val
    # end
    # result


  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
