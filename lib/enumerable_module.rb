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
    my_each { |element| return false unless yield element }
    true
  end

  def my_any?
    my_each { |element| return true if yield element }
    false
  end

  def my_none?
    my_each { |element| return false if yield element }
    true
  end

  def my_count
    count = 0
    my_each { |element| count += 1 if yield element }
    count
  end

  def my_map
    pivot_array = []
    my_each { |element| pivot_array << yield(element) }
    p pivot_array
  end

  def my_inject(inject_parameter = nil)
    if inject_parameter
      total = inject_parameter
      start_index = 0
    else
      total = first
      start_index = 1
    end
    self[start_index...length].my_each do |element|
      total = yield(total, element)
    end
    total
  end
end
