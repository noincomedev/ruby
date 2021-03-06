require "./lib/enumerable_methods.rb"

RSpec.describe Enumerable do
  describe "#my_each" do
    it "should return each item" do
      expect([1,2,3].my_each{|x| x}).to eql([1,2,3])
    end
  end
  describe "#my_each_with_index" do
    it "should return each item with index" do
      expect([1,2,3].my_each_with_index{|val,i| [val, i]}).to eql(3)
    end
  end
  describe "#my_count" do
    it "return the size of the array" do
      expect([10,6,35,23,10].my_count{ |i| i } ).to eql(5)
    end
  end
  describe "#my_select" do
    it "obtain the even numbers " do
      expect([8,18,20,4,30].my_select{|x| x%2==0}).to eql([8,18,20,4,30])
    end
  end
  describe "#my_any?" do
    it "should return true if any item" do
      expect([1,2,3].my_any?{|x| x}).to eql(true)
    end
  end
  describe "#my_none?" do
    it "return true if the item searched exist" do
      expect([1,8,nil,9,10].my_none?{|x| x==nil}).to eql(false)
    end
  end
end