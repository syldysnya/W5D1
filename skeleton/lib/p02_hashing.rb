class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.inject do |acc, ele|
      acc = acc.to_i ^ ele.to_i
    end
    self.map(&:to_s)
  end

  # def compare
  #   (0...self.length).each do |i|
  #     return false if self[i] != self.hash[i]
  #   end
  #   self
  # end
end
 
class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
