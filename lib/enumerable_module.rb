module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    array = to_a
    array.count.times do |index|
      yield(array[index])
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    array = to_a
    array.count.times do |index|
      yield(array[index], index)
    end
    self
  end

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

  def my_any?(pattern = nil)
    return my_any?(pattern) { |value| value } unless block_given?

    case pattern
    when Regexp
      # TODO
      my_any? { |value| value.match(pattern) }
    when Class
      # TODO
      my_any? { |value| value.is_a? pattern }
    when nil
      my_each { |value| return true if yield(value) }
      false
    else
      my_any? { |value| value == pattern }
    end
  end

  def my_none?(pattern = nil, &block)
    !my_any?(pattern, &block)
  end

  def my_count(pivot = nil)
    arr = instance_of?(Array) ? self : to_a
    return arr.length unless block_given? || pivot

    if pivot
      return arr.my_select { |item| item == pivot }.length
    else
      return arr.my_select { |item| item == pivot }.length
    end
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

  def my_inject(control = nil, block = nil)
    block, control = control, nil if (!control.nil? && block.nil?) && (control.is_a?(Symbol) || control.is_a?(String))
    # TODO
    if !block_given? && !block.nil?
      p !block_given? && !block.nil?
      to_a.my_each { |element| control = control.nil? ? element : control.send(block, element) }
    else
    # TODO TEST #1 #2
      to_a.my_each { |element| control = control.nil? ? element : yield(control, element) }
    end
    control
  end
end

def multiply_els(array)
  array.my_inject(1) { |count, value| count * value }
end
