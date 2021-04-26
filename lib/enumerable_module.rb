module Enumerable
  def my_each
    object_type = if instance_of?(Array)
                    self
                  elsif instance_of?(Range)
                    to_a
                  else
                    flatten
                  end
    object_type.size.times do |index|
      yield object_type[index]
    end
  end

  def my_each_with_index
    object_type = if instance_of?(Array)
                    self
                  elsif instance_of?(Range)
                    to_a
                  else
                    flatten
                  end
    object_type.size.times do |index|
      yield object_type[index], index
    end
  end

  def my_select
    pivot_array = []
    my_each { |element| pivot_array << element if yield element }
    pivot_array
  end

  def my_all?
    my_each { |element| return false if !yield element }
    true
  end

  def my_any?
    my_each { |element| return true if yield element }
    false
  end
end

def my_none?
    my_each { |element| return false if yield element }
    true
end