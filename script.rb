require_relative './lib/enumerable_module'
[1, 2, 3].my_each do |element|
  # p element
end

(1..3).my_each do |element|
  # p element
end

{ 1 => 1, 2 => 2, 3 => 3 }.my_each do |element|
  # p element
end

[1, 2, 3].my_each_with_index do |element, index|
  # puts element, index
end

[1, 2, 3].my_select do |element|
  element != 3
end

[1, 2, 3].my_all? do |element|
  element > 4
end
[1, 2, 3].my_all? do |element|
  element < 4
end
[1, 2, 3].my_any? do |element|
  element == 5
end
[1, 2, 3].my_none? do |element|
  element == 5
end
[1, 2, 3].my_count do |element|
  element == 5
end

[1, 2, 3].my_map do |element|
  element * 2
end

def multiply_els(array)
  array.my_inject { |element, next_element| element * next_element }
end

p multiply_els([2,4,5]) 