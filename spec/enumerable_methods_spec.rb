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
end