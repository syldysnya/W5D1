class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      store[num] = true
    else
      validate!(num)
    end
  end
  
  def remove(num)
    self.store[num] = false
  end
  
  def include?(num)
    store[num] == true
  end
  
  private
  
  def is_valid?(num)
    (0...@store.length).include?(num)
  end
  
  #don't know what to do
  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      self[num] << num
    end
    false
  end
  
  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
    if !include?(num)
      if count < num_buckets
        self[num].push(num)
        @count += 1
      else
        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count-=1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup_store = @store
    @store = Array.new(count * 2) { Array.new }
    @count += 1
    dup_store.each do |bucket|
      if !bucket.empty?
        num = bucket.first % num_buckets
        
      end
    end
    # p "count : #{count}"
  end
end
