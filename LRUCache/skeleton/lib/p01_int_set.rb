require 'byebug'
class MaxIntSet
  def initialize(max)
    @max = max 
    @store = Array.new(max) {false}
    
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max 
    @store[num] = true 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    idx = num % @num_buckets
    @store[idx] << num 
  end

  def remove(num)
    idx = num % @num_buckets
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % @num_buckets
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      self[num] << num
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  result = []
    @store.each do |bucket|
      bucket.each do |el|
        result << el
      end
    end
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    result.each do |el|
      insert(el)
    end
  end
end
