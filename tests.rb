require_relative './lib/enumerable_module'

(1..3).each do |element|
  p element *= 3
end
(1..3).my_each do |element|
  p element *= 3
end
