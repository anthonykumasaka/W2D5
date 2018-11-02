class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += el * idx 
    end
    result
  end
end

class String
  def hash
    lower_alpha = ("a".."z").to_a
    upper_alpha = ("A".."Z").to_a
    alphabet = lower_alpha.concat(upper_alpha)
    result = 0
    self.chars.each_with_index do |ch, i|
      result += alphabet.index(ch) * i 
    end
    result 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    lower_alpha = ("a".."z").to_a
    upper_alpha = ("A".."Z").to_a
    alphabet = lower_alpha.concat(upper_alpha)
    result = 0
    array = self.sort_by {|k,v| v}
    array.each_with_index do |sub_array, i|
      if sub_array[1].is_a?(Integer)
        result += sub_array[1]
      else 
        result  += alphabet.index(sub_array[1]) * i 
      # .each_with_index do |el, j|
      end 
    end
    result 
  end
end
