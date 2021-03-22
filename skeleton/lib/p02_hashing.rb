class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = 0

    self.each_with_index do |ele, i|
      num += ele.hash * i
    end

    num
  end
end
 
class String
  def hash
    alpha = ('a'..'z').to_a
    alpha += ('A'..'Z').to_a

    arr = self.split('')
    
    num = 0

    arr.map do |ele|
      idx = alpha.index(ele)
    end.hash
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    p self
    0
  end
end
