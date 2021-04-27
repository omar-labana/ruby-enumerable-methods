require_relative './lib/enumerable_module'
[1, 2, 3].my_each_with_index do |element, index|
  p element, index
end
