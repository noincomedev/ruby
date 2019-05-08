module Enumerable
  def my_each
  	i = 0
  	while i < self.size
    	yield(self[i])
    	i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    output = []
    self.my_each do |mc|
      if yield(mc)
        output << mc
      end
    end
    output
  end

  def my_all?
    self.my_each {|i| return true unless yield(i) }
    true
  end

  def my_any?
    self.my_each {|i| return false if yield(i) }
    false
  end

  def my_none?
    self.my_each {|i| return false if yield(i) }
    false
  end

  def count
    count = 0
    self.my_each { |i| return count += 1 if yield(i) }
  end

  def my_map(procs=nil)
    arr = []
    if procs && block_given?
      self.my_each {|i| arr << procs.call(yield(i))}
    elsif block_given?
      self.my_each {|i| arr << yield(i) }
    else
      self.my_each {|i| arr << procs.call(i) }
    end
  end

  def my_inject(input)
    self.my_each {|i| input = yield(input,i) }
    input
  end
end

array = [2,3,4]
def multiply_els(array)
  puts array.my_inject(1) {|x, y| x*y}
end

multiply_els(array)
