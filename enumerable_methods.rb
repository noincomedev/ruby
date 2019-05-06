module Enumerable
  def my_each
    for item in self do yield item end
  end
  def my_each_with_index
    index = 0
    for item in self do
      yield(self[index], index)
      index += 1
    end
  end
  def my_select
    output = []
    self.my_each do |item|
      if yield(item)
        output << item
      end
    end
    output
  end
  def my_all
    for item in self do yield item end
  end
  def my_any
    self.length > 0
  end
  def my_none
    self.length == 0
  end
  def my_count
    self.length
  end
  def my_map
    output = []
    self.my_each do |item|
      if yield(item)
        output << item
      end
    end
    output
  end
  def my_inject(input = 1)
    self.my_each {|i| input = yield(input,i) }
    input
  end
end

array = [2,4,5]

def multiply_els(array)
  puts array.my_inject {|x, y| x*y}
end

multiply_els(array)