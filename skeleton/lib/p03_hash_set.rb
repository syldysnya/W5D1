class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      if count < num_buckets
        self[key.hash].push(key.hash)
        @count += 1
      else
        resize!
        self[key.hash].push(key.hash)
      end
    end
  end

  def include?(key)
    # p self
    self[key.hash].include?(key.hash) ? true : false
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key.hash) 
      @count -= 1
    # else
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup_set = @store.dup
    @store = Array.new(count * 2) { Array.new }
    @count += 1

    dup_set.each do |bucket|
      if !bucket.empty?
        bucket.each do |ele|
          self[ele].push(ele)
        end
      end
    end
  end
end
