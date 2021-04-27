module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    self.size.times do |index|
      if is_a?(Array)
        yield(self[index])
      elsif is_a?(Hash)
        yield(keys[index], self[keys[index]])
      elsif is_a?(Range)
        yield(to_a[index])
      end
    end
    self
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

  def my_map(proc = nil)
    pivot_array = []
    if proc.nil?
      my_each { |element| pivot_array << yield(element) }
    else
      my_each { |element| pivot_array << proc.call(element) }
    end
    pivot_array
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
