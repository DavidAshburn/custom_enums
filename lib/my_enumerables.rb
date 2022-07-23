module Enumerable
  # stuck with self.length because I think it's faster
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    return self
  end

  def my_select
    list = []
    self.each do |y|
      list.push(y) if yield(y)
    end 
    list
  end
end

class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end
end