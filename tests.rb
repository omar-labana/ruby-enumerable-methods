require_relative './lib/enumerable_module'
# [1, 2, 3].my_each_with_index do |element, index|
#   p element, index
# end

puts '#my_each'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each { |name| puts name }

puts '#my_each_with_index'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each_with_index { |name, index| puts name if index.odd? }

puts '#my_select'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_select { |name|  name != 'Aaron' })

puts '#my_all?'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_all? { |item|  item.length >= 4 })
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_all? { |item|  item.length >= 6 })
puts [].my_any?

puts '#my_any?'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_any? { |item|  item.length >= 4 })
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_any? { |item|  item.length >= 6 })
puts [].my_any?
