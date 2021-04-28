module Enumerable
  def my_each
    return to_a(:my_each) unless block_given?
    array = self.to_a 
    array.count.times do |index|
        yield(array[index])
    end
    self
  end

  def my_each_with_index
    return to_a(:my_each_with_index) unless block_given?
    array = self.to_a 
    array.count.times do |index|
        yield(array[index], index)
    end
    self  end

  def my_select
    return to_enum(:my_select) unless block_given?

    pivot_array = []
    my_each do |array_element|
      pivot_array << array_element if yield(array_element)
    end
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

  def my_any?(*pattern)
    valid = false

    if !pattern[0].nil?
      my_each { |element| valid = true if pattern[0] == element }
    elsif !block_given?
      my_each { |element| valid = true if element }
    else
      my_each { |element| valid = true if yield(element) }
    end
    valid
  end

  def my_none?(pattern = nil, &block)
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

  def my_inject(_inject_parameter = nil)
    return my_map { |element| proc.call(element) } unless proc

    # TODO
    if block_given?
      total = []
      my_each { |element| total.push(yield(element)) }
      total
    else
      Enumerator.new { |element| my_map { |accu| element << accu } }
    end
    total
  end
end

def multiply_els(array)
  array.my_inject(1) { |count, value| count * value }
end