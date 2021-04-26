require_relative './lib/enumerable_module'
if false
  [1, 2, 3].my_each do |element|
    p element
  end
  
  (1..3).my_each do |element|
    p element
  end
  
  { 1 => 1, 2 => 2, 3 => 3 }.my_each do |element|
    p element
  end
  
  [1, 2, 3].my_each_with_index do |element, index|
    puts element, index
  end
  
  [1, 2, 3].my_select do |element|
    element != 3
  end

  a = [1, 2, 3].my_all? do |element|
    element > 4
  end
  a = [1, 2, 3].my_all? do |element|
    element < 4
  end
  a = [1, 2, 3].my_any? do |element|
    element == 5
  end
end

p a