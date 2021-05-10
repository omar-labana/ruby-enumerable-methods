# spec/calculator_spec.rb
# rubocop:disable Lint/UselessAssignment
require_relative '../lib/enumerable_module'
array = [1, 2, 3, 4, 5]
describe Enumerable do
  describe '#my_each' do
    it 'maps an object to given block' do
      expect(array.my_each { |item| item += 1 })
        .to eql(array.each { |item| item += 1 })
    end
  end

  describe '#my_each_with_index' do
    it 'maps each object element to given block along with its index' do
      expect(array.my_each_with_index { |item, index| item += index })
        .to eql(array.each_with_index { |item, index| item += index })
    end
  end
end
# rubocop:enable Lint/UselessAssignment
