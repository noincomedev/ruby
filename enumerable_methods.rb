module Enumerable
  def my_each
    for item in self do
      yield(item)
    end
  end
  def my_each_with_index
     self.length.times{ |i| yield(self[i],i) }
  end
  def my_select
    arr=[]
    self.my_each{ |i| yield(i) ? arr.push(i) : i }
    arr
  end
  def my_all? &block
    self.my_each do |x|
      return false if yield(x) == false
    end
    true
  end
  def my_any?
    flag=false
      self.my_each { |x| yield(x) ? flag=1 : false }
    return flag == 1 ? true : false
  end
  def my_none?
    flag=false
    self.my_each{ |item| yield(item) ? flag=true : false }
      flag==false ? true : false
  end
  def my_count
    i = 0
    count = 0
    while i < self.length
      if block_given?
        if yield self[i]
          count = count + 1
        end
      else
        count = count + 1
      end
      i = i + 1
    end
    count
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
    arr
  end
  def my_inject
    flag=false
    x=1
    self.my_each { |item|
    if flag==false
      x=item
      flag=true
    else
      x = yield(x,item)
    end
    }
    x
  end
  def multiply_els(array)
    array.my_inject{ |num,x| num *= x }
  end
end