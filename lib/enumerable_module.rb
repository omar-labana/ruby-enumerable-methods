module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |index|
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
    return to_enum(:my_each_with_index) unless block_given?

    size.times do |index|
      if is_a?(Array)
        yield(self[index], index)
      elsif is_a?(Hash)
        yield(keys[index], self[keys[index]])
      elsif is_a?(Range)
        yield(to_a[index], index)
      end
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    pivot_array = []
    my_each { |element| pivot_array << element if yield element }
    pivot_array
  end

  def my_all?(pattern = nil)
    return my_all?(pattern) { |void| void } unless block_given?

    # regex control
    case pattern

    when Regexp
      my_all? { |element| element.match(pattern) }
    when Class
      my_all? { |element| element.is_a? pattern }
    when nil
      my_each { |element| return false unless yield(element) }
      true
    else
      my_all? { |element| element == pattern }
    end
  end

  def my_any?(pattern = nil)
    return my_all?(pattern) { |void| void } unless block_given?

    # regex control
    case pattern

    when Regexp
      my_all? { |element| element.match(pattern) }
    when Class
      my_all? { |element| element.is_a? pattern }
    when nil
      my_each { |element| return true unless yield(element) }
      false
    else
      my_all? { |element| element == pattern }
    end
  end

  def my_none?(pattern = nill, &block)
    !my_any?(pattern, &block)
  end

  def my_count(pivot = nil)
    arr = instance_of?(Array) ? self : to_a
    return arr.length unless block_given? || pivot

    count = 0
    arr.my_each { |element| count += 1 if yield element }
    count
  end

  def my_map(proc = nil)
    return to_enum unless block_given? || proc
    pivot_array = []
    if proc.nil?
      my_each { |element| pivot_array << yield(element) }
    else
      my_each { |element| pivot_array << proc.call(element) }
    end
    pivot_array
  end

  def my_inject(inject_parameter = nil)
    return my_map { |element| proc.call(element) } unless proc 
    # TODO 
    if block_given?
      total = []
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
