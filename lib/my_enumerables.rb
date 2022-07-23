module Enumerable
  def my_each_with_index
    if block_given?
      i = 0
      while i < self.length
        yield(self[i], i)
        i += 1
      end
      return self
    end
  end

  def my_select
    if block_given?
      list = []
      self.my_each do |val|
        list.push(val) if yield(val)
      end 
      list
    end
  end

  def my_all?
    if block_given?
      self.my_each do |val|
        return false unless yield(val)
      end
      return true
    end
  end

  def my_any?
    if block_given?
      self.my_each do |val|
        return true if yield(val)
      end
      return false
    end
  end

  def my_none?
    if block_given?
      self.my_each do |val|
        return false if yield(val)
      end
      return true
    end
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |val|
        count += 1 if yield(val)
      end
      return count
    else
      return self.length
    end
  end

  def my_map
    if block_given?
      list = []
      self.my_each do |val|
        list.push(yield(val))
      end
      return list
    end
  end

  def my_inject(init_val = 0)
    if block_given?
      reduction = init_val
      self.my_each do |val|
        reduction = yield(reduction, val)
      end
      return reduction
    end
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

#these are pretty but holy crap it takes a while to wrap your head around
=begin

you may accept parameters into "block yielding functions" and these are dead easy to handle
but the user needs to know more about the function of the method

a block passed will include pipes |somevar1, somevar2|

use the same order and pass values with () to yield ==> yield(somevar1, somevar2)
this will link the references inside the method, and inside the block

yield returns the value of the last evaluated expression, you can assign it's value to variables
this is how reduction to a single value works in my_injection

That's pretty much it but it's hard to think about until you go through these yourself and I'm 
not sure I could teach it yet