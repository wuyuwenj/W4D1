require 'byebug'
class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    return self if self.length <2 
    prc ||= Proc.new {|a,b|a<=>b}
    mid =self.length/2
    left=self.take(mid).merge_sort(&prc)
    right=self.drop(mid).merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    new=[]
    until left.empty?||right.empty?
      if prc.call(left[0],right[0])==-1
        new<<left.shift
      else
        new<<right.shift
      end
    end
    new+left+right
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    result=[]
    (0...self.length).each do |first|
      (first+1...self.length).each do |last|
        if self[first] + self[last]==target&&!result.include?(first)&&!result.include?(last)
          result<<[first,last]
        end
      end
    end
    result
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    return self if !self.is_a?(Array)
    new=[]
    self.each do |el|
      #debugger
      if el.is_a?(Array)&&level!=0
        new<<el
      else

      end
    end
    new
  end
  
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    result=[]
    (0...self.length).each do |front|
      (front+1...self.length).each do |back|
        temp=self[front..back]
        if temp.reverse==temp
          result<<temp
        end
      end
    end
    result
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
    return nil if n==0
    i=0
    result=1
    count=1
    while i<n
      found=false
      #debugger
      while found==false
        count+=1
        if is_prime?(count)
          result=count
          found=true
        end
      end
      i+=1
    end
    result
end

def is_prime?(num)
  (2...num).each {|el|return false if num%el==0}
  true
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i=0
    while i<self.length
      prc.call(self[i])
      i+=1
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    new=[]
    self.each {|el|new<<el if prc.call(el)}
    new
  end
end

