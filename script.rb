require_relative './lib/enumerable_module'
{a:1, b:2, c:3}.each do |element|
  p element [0], element[1]
end

[1,2,3].my_each do |element|
  # p element
end
 
(1..3).my_each do |element|
  # p element
end